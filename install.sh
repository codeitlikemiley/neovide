#!/bin/bash

os=$(uname -s)

if [ "$os" == "Darwin" ]; then
	if ! command -v brew &>/dev/null; then
		echo "Homebrew is not installed."
		echo "please visit Official site of brew at https://brew.sh and install it from there"
		echo "or you can run this command on your terminal by copy pasting it on your terminal\n"
		echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
		exit 1
	fi
fi

detect_package_manager() {
	if command -v apt-get >/dev/null 2>&1; then
		echo "apt-get"
	elif command -v yum >/dev/null 2>&1; then
		echo "yum"
	elif command -v dnf >/dev/null 2>&1; then
		echo "dnf"
	elif command -v pacman >/dev/null 2>&1; then
		echo "pacman"
	elif command -v zypper >/dev/null 2>&1; then
		echo "zypper"
	elif command -v brew >/dev/null 2>&1; then
		echo "brew"
	else
		echo "unknown"
	fi
}

package_manager=$(detect_package_manager)
if [ "$package_manager" == "unknown" ]; then
	echo "Unknown package manager. Exiting."
	echo "Please file an Issue on: http://github.com/codeitlikemiley/nvim"
	exit 1
fi

append_to_zshrc() {
	string_to_append=$(
		cat <<EOM
if command -v pyenv 1>/dev/null 2>&1; then
  eval "\$(pyenv init -)"
fi

if command -v pyenv-virtualenv-init 1>/dev/null 2>&1; then
  eval "\$(pyenv virtualenv-init -)"
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi
EOM
	)

	echo "$string_to_append" >>"$HOME/.zshrc"
	source ~/.zshrc
	echo "Successfully appended to .zshrc."
}
# This will install lldb-vscode
if ! command -v llvm &>/dev/null; then
	$package_manager install llvm
fi

# Check for Neovim
if ! command -v neovim &>/dev/null; then
	echo "Neovim is not installed."
	echo "Installing Neovim..."
	$package_manager install neovim
fi

# Check for pyenv and pyenv-virtualenv
if ! command -v pyenv &>/dev/null; then
	$package_manager install pyenv pyenv-virtualenv
fi

# Check for Python
if ! command -v python &>/dev/null; then
	# Replace this with the specific version you want
	pyenv install 3.11.5
	# Set the default version
	pyenv global 3.11.5
fi

# Check for pip
if ! command -v pip &>/dev/null; then
	# If we don't have .zshrc on our home directory
	if [ -f "$HOME/.zshrc" ]; then
		append_to_zshrc
	else
		echo "It seems you don't have .zshrc on your home directory."
		echo "Please copy and paste this, and append it to your shell config file."
		echo ".zprofile, .profile, .zshrc, .zshenv"
		echo "------------------------------------------------------------"
		echo "$string_to_append"
		echo "------------------------------------------------------------"
		echo "Please source ~/.zshrc or restart your terminal."
		echo "And re-run this script again."
		echo "If you get stuck please file issue on https://github.com/codeitlikemiley/nvim"
		exit 1
	fi
fi

# Check for rustup
if ! command -v rustup &>/dev/null; then
	echo "Rust command could not be found."
	echo "Installing Rust..."
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	# load rustup to our shell , so cargo command will be available
	source $HOME/.cargo/env
	# quickly install bin crates instead of building them from source
	cargo install cargo-binstall
	# install creates needed by neovide / neovim to act as an IDE
	cargo binstall -y cargo-update cargo-watch cargo-nextest sqlx-cli evcxr_repl --secure
else
	# If user already have rust installed then we just need to install cargo binstall and other crates
	cargo install cargo-binstall
	# install creates needed by neovide / neovim to act as an IDE
	cargo binstall -y cargo-update cargo-watch cargo-nextest sqlx-cli evcxr_repl --secure
fi

# Install Neovide
if ! command -v neovide &>/dev/null; then
	$package_manager install neovide
fi

# macOS-specific steps
if [ "$os" == "Darwin" ]; then
	if [ ! -d "$HOME/.local/bin" ]; then
		echo "Creating ~/.local/bin directory..."
		mkdir -p "$HOME/.local/bin"
	fi

	if [ -f "$HOME/.zshrc" ]; then
		# Append the PATH update to .zshrc
		echo 'export PATH="$HOME/.local/bin:$PATH"' >>"$HOME/.zshrc"

		# Step 3: Source .zshrc to apply the changes
		source "$HOME/.zshrc"
		echo "Sourced .zshrc to apply the changes."
	else
		# If ~/.zshrc doesn't exist, instruct the user to add it themselves
		echo ".zshrc not found in your home directory."
		echo "Please add the following line to your .zshrc manually:"
		echo 'export PATH="$HOME/.local/bin:$PATH"'
		exit 1
	fi

	# Create the neovide script in ~/.local/bin
	cat <<'EOF' >"$HOME/.local/bin/neovide"
  #!/bin/bash
  exec "/Applications/Neovide.app/Contents/MacOS/neovide" "$@"
EOF

	# Make the script executable
	chmod +x "$HOME/.local/bin/neovide"

	neovide_path=$(sed -n '2p' /opt/homebrew/bin/neovide | awk -F '"' '{print $2}' | sed 's/\(Neovide.app\).*$/\1/')

	if [ -n "$neovide_path" ]; then
		# Copy Neovide.app to /Applications/
		cp -R "$neovide_path" /Applications/
		echo "Successfully copied Neovide.app to /Applications/"
	fi
fi

# Install Git
if ! command -v git &>/dev/null; then
	$package_manager install git
fi

# Install LazyGit
if ! command -v lazygit &>/dev/null; then
	$package_manager install lazygit
fi
