# Filebrowser directory setup

Set correct ownership and permissions for the File Browser config and database directories so the container can write to them.

Run these from the `filebrowser` compose directory on the host:

```bash
sudo chown -R 1000:1000 ./filebrowser_config ./filebrowser_db
chmod -R u+rwX ./filebrowser_config ./filebrowser_db
```

- `chown` sets owner to UID/GID `1000` (common non-root container user). Change the UID/GID if your container expects a different user.
- `chmod` grants the owner read/write and makes directories traversable.

If you prefer the current host user to own the folders, replace `1000:1000` with `$(id -u):$(id -g)`.

After updating permissions restart the service:

```bash
docker compose up -d --no-deps --force-recreate filebrowser
```

That's it.
