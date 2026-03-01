# ubuntu-linux-util

Simple utility scripts for Ubuntu/Linux and MacOS

* Branch `master` - Ubuntu/Linux

* Branch `mac` - MacOS

## Requirements

- Git — install as root with:
  ```bash
  apt update && apt install git
  ```

## Installation

Clone the repo as root to `/usr/local/lib`:

```bash
git clone <repo-url> /usr/local/lib/ubuntu-linux-util
cd /usr/local/lib/ubuntu-linux-util
```

Run as root to install system-wide configuration and utilities:

```bash
./install.sh
```

Run as the non-root user who will be using the system to install user-specific configuration:

```bash
./install_user.sh
```
