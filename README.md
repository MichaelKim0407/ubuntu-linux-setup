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
./install_system.sh
```

Run as the non-root user who will be using the system to install user-specific configuration:

```bash
./install_user.sh
```

On desktop systems, run as root to install desktop packages and applications:

```bash
./install_desktop.sh
```

Run as the non-root user to apply desktop configuration:

```bash
./install_desktop_user.sh
```

## Updating

Pull the latest changes as root:

```bash
git -C /usr/local/lib/ubuntu-linux-util pull
```

Symlinks installed by `install_system.sh` and `install_user.sh` point directly into the repo, so most changes take effect immediately without re-running the install scripts.

Re-run the install scripts only if new files have been added. Use `--force` to overwrite any files that were previously installed but have since been modified locally.

As root:

```bash
./install_system.sh --force
```

As the non-root user:

```bash
./install_user.sh --force
```

For desktop scripts, re-run them as needed:

As root:

```bash
./install_desktop.sh
```

As the non-root user:

```bash
./install_desktop_user.sh
```

## Documentation

Per-component documentation is in [`docs/`](docs/).
