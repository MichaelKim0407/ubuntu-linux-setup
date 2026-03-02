# Docker

Installs Docker Engine and adds the user to the docker group.

Run as root from the repo root to install Docker Engine:

```bash
install/docker.sh
```

Run as the non-root user to add that user to the docker group:

```bash
install/docker-user.sh
```

A restart is required after adding the user to the docker group.
