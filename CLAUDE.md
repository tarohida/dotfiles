# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a dotfiles repository for managing bash configuration, vim setup, and utility functions across Linux/WSL environments. The configuration is designed to be deployed to remote servers via SSH.

## Setup and Installation

### Initial Setup
```bash
cd ~/
git clone --depth 1 'https://github.com/taro-hida/dotfiles.git'
bash ~/dotfiles/setup.sh
```

The setup script:
- Backs up existing `.bashrc` and `.vimrc` files to timestamped backup directory
- Installs amix/vimrc (awesome vim configuration)
- Creates hook directory with `pre.sh` and `post.sh` if they don't exist
- Symlinks `~/dotfiles/bashrc` to `~/.bashrc`

### No Build/Test Commands
This repository has no build system, linter, or test suite. Changes should be tested manually by sourcing the bashrc or testing individual functions.

## Architecture

### Hook System (Pre/Post Execution)
The bashrc configuration uses a hook system that executes in this order:

1. **Pre-hook** (`hook/pre.sh`) - Runs before loading bashrc.d modules
2. **Module loading** - Sources all files in `bashrc.d/` directory
3. **Post-hook** (`hook/post.sh`) - Runs after all modules loaded

The hook files are created by `setup.sh` if they don't exist, allowing user-specific customizations without modifying tracked files.

### Module System (bashrc.d/)
Configuration is split into numbered modules that load in order:
- `80-promptrc` - Custom bash prompt with git branch display and color
- `95-functions` - Core utilities and aliases
- `96-gcloud.sh` - Google Cloud Platform wrapper and helpers
- `97-php.sh` - PHP/Composer setup
- `98-setup.sh` - Git, SSH, and directory setup functions

Modules are sourced alphabetically, so numbering controls load order.

### Key Design Patterns

**gcloud-wrapper function**: Intercepts all `gcloud` commands via alias to provide shorthand syntax:
- `gcloud switch PROJECT` → `gcloud config set project PROJECT`
- `gcloud list instances` → `gcloud compute instances list`
- `gcloud start NAME` → `gcloud compute instances start NAME`
- `gcloud rename OLD NEW` → Stops instance, then renames it
- Falls back to real gcloud for unrecognized commands

**SSH deployment pattern**: The `ssh-deploy-dotfiles-to` function packages the dotfiles directory as tarball, uploads via SFTP, and executes setup.sh remotely.

**Custom prompt**: The prompt (PS1) shows time, username, hostname, working directory, and current git branch in color.

## Key Functions and Commands

### SSH Key Management
- `ssh-upload-pubkey-to HOST [KEYPATH]` - Upload public key to remote host's authorized_keys
- `ssh-upload-pubkey-to-root HOST` - Upload key to both user and root, enable root login
- `ssh-deploy-dotfiles-to HOST` - Deploy entire dotfiles setup to remote host

### Docker Utilities
- `docker-stop-all` - Stop all running containers
- `docker-compose-up-force` - Stop all containers and run docker-compose up

### GCloud Commands (via gcloud-wrapper)
- `gcloud-create-instance NAME IMAGE_PROJECT IMAGE_FAMILY` - Create compute instance
- `gcloud-create-rocky9 SUFFIX` - Quick Rocky Linux 9 instance creation
- `gcloud list machine-types` - List available machine types in ap-northeast1-a
- `gcloud list zone` - List Asian zones
- `gcloud change machine-types INSTANCE TYPE` - Stop, change machine type

### Setup Functions
- `setup-git` - Interactive git config setup (user.name, user.email, push.autoSetupRemote)
- `setup-ssh-config` - Append standard SSH config to ~/.ssh/config
- `setup-dirs` - Generate script to set /usr/local/bin permissions
- `php-setup-composer` - Download and install Composer globally

### Utility Functions
- `trim_comment FILE` - Remove comments and blank lines from file
- `abpath RELATIVE_PATH` - Convert relative path to absolute

## Important Implementation Details

### File Paths in bashrc
The main `bashrc` file uses relative paths starting with `./dotfiles/`:
```bash
source "./dotfiles/hook/pre.sh"
for file in ./dotfiles/bashrc.d/* ; do
    source "$file"
done
```

This assumes bashrc is sourced from the home directory where the dotfiles directory exists.

### Vim Configuration Structure
- Main config: `vimrc` in repository root
- Uses both vim-plug and NeoBundle plugin managers
- PHP development focused (phpactor plugin)
- Loads local overrides from `~/.vimrc.local` if present
- Space is leader key

### Git Configuration
The repository configures `push.autoSetupRemote true` to automatically set up tracking for new branches.
