#!/usr/bin/env bash
# Install this Neovim config on a new machine.
# Usage: ./install.sh
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
MIN_NVIM_MAJOR=0
MIN_NVIM_MINOR=12

info()  { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
ok()    { printf '\033[1;32m==>\033[0m %s\n' "$*"; }
warn()  { printf '\033[1;33m==>\033[0m %s\n' "$*"; }
fail()  { printf '\033[1;31m==>\033[0m %s\n' "$*" >&2; exit 1; }

have() { command -v "$1" >/dev/null 2>&1; }

os_name="$(uname -s)"
arch_name="$(uname -m)"

nvim_version_ok() {
  have nvim || return 1
  local ver major minor
  ver="$(nvim --version | head -n1 | grep -Eo '[0-9]+\.[0-9]+' | head -n1)"
  major="${ver%%.*}"
  minor="${ver#*.}"
  [ "$major" -gt "$MIN_NVIM_MAJOR" ] || {
    [ "$major" -eq "$MIN_NVIM_MAJOR" ] && [ "$minor" -ge "$MIN_NVIM_MINOR" ]
  }
}

ensure_homebrew() {
  if have brew; then
    return
  fi
  info "Installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
  have brew || fail "Homebrew installed, but brew is not on PATH. Open a new terminal and re-run ./install.sh"
}

install_deps() {
  case "$os_name" in
    Darwin)
      ensure_homebrew
      info "Installing macOS packages..."
      brew install neovim git ripgrep fd node unzip cmake
      brew install --cask font-jetbrains-mono-nerd-font 2>/dev/null || true
      ;;
    Linux)
      if have apt-get; then
        info "Installing Debian/Ubuntu packages..."
        sudo apt-get update
        sudo apt-get install -y git curl unzip tar make gcc ripgrep fd-find xclip nodejs npm
        if have fdfind && ! have fd; then
          mkdir -p "$HOME/.local/bin"
          ln -sfn "$(command -v fdfind)" "$HOME/.local/bin/fd"
          export PATH="$HOME/.local/bin:$PATH"
        fi
      elif have dnf; then
        info "Installing Fedora packages..."
        sudo dnf install -y git curl unzip tar make gcc ripgrep fd-find xclip nodejs npm neovim || true
      elif have pacman; then
        info "Installing Arch packages..."
        sudo pacman -Sy --noconfirm git curl unzip tar make gcc ripgrep fd xclip nodejs npm neovim || true
      else
        warn "Unknown Linux distro. Install git, curl, unzip, make, gcc, ripgrep, fd, and node yourself."
      fi
      ;;
    *)
      fail "Unsupported OS: $os_name"
      ;;
  esac
}

install_neovim_github() {
  local asset dest tmp extracted
  tmp="$(mktemp -d)"
  dest="$HOME/.local/nvim"

  case "$os_name-$arch_name" in
    Darwin-arm64)  asset="nvim-macos-arm64.tar.gz" ;;
    Darwin-x86_64) asset="nvim-macos-x86_64.tar.gz" ;;
    Linux-x86_64)  asset="nvim-linux-x86_64.tar.gz" ;;
    Linux-aarch64) asset="nvim-linux-arm64.tar.gz" ;;
    *) fail "No Neovim binary for $os_name $arch_name. Install Neovim 0.12+ manually." ;;
  esac

  info "Downloading Neovim ($asset)..."
  curl -fsSL "https://github.com/neovim/neovim/releases/latest/download/$asset" -o "$tmp/$asset"
  tar -xzf "$tmp/$asset" -C "$tmp"

  extracted="$(find "$tmp" -maxdepth 1 -type d -name 'nvim-*' | head -n1)"
  [ -n "$extracted" ] || fail "Failed to extract Neovim archive"

  rm -rf "$dest"
  mkdir -p "$HOME/.local"
  mv "$extracted" "$dest"
  mkdir -p "$HOME/.local/bin"
  ln -sfn "$dest/bin/nvim" "$HOME/.local/bin/nvim"
  export PATH="$HOME/.local/bin:$PATH"
  rm -rf "$tmp"
  ok "Neovim installed to $dest"
}

ensure_neovim() {
  if nvim_version_ok; then
    ok "Neovim $(nvim --version | head -n1) is ready"
    return
  fi

  warn "System Neovim is missing or older than 0.12. Installing the latest GitHub release..."
  install_neovim_github
  nvim_version_ok || fail "Neovim 0.12+ is required (this config uses built-in vim.pack)."
  ok "Neovim $(nvim --version | head -n1) is ready"
}

link_config() {
  mkdir -p "$(dirname "$NVIM_CONFIG")"

  if [ -L "$NVIM_CONFIG" ]; then
    local current
    current="$(readlink "$NVIM_CONFIG")"
    if [ "$current" = "$REPO_DIR" ]; then
      ok "Config already linked: $NVIM_CONFIG -> $REPO_DIR"
      return
    fi
  fi

  if [ -e "$NVIM_CONFIG" ] || [ -L "$NVIM_CONFIG" ]; then
    local backup="${NVIM_CONFIG}.bak.$(date +%Y%m%d-%H%M%S)"
    info "Backing up existing config to $backup"
    mv "$NVIM_CONFIG" "$backup"
  fi

  ln -s "$REPO_DIR" "$NVIM_CONFIG"
  ok "Linked $NVIM_CONFIG -> $REPO_DIR"
}

bootstrap_plugins() {
  info "Installing plugins, language servers, and formatters (this can take a few minutes)..."
  nvim --headless "+MasonToolsInstallSync" "+qa" \
    || warn "Headless bootstrap finished with warnings. Open nvim once if plugins look incomplete."
  ok "Plugin bootstrap finished"
}

info "Setting up Neovim from $REPO_DIR"
install_deps
ensure_neovim
link_config
bootstrap_plugins

ok "Done. Start Neovim with: nvim"
echo
echo "  Leader key is Space."
echo "  Keybindings: $REPO_DIR/KEYBINDINGS.md"
echo "  Search keymaps inside nvim: <Space>sk"
echo
