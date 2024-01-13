# Gitlab service

## Description
GitLab service integrated inside convenient docker environment

## Install
```bash
cp .env{.example,}
```

Edit `.env` file

Generate root password:
```bash
./scripts/generate-root-password.sh
```

```bash
docker compose up -d
```

## Clean up installation
```bash
docker compose down -v
```

## Snippets
- Editing config
  ```bash
  docker compose exec -it gitlab editor /etc/gitlab/gitlab.rb
  ```

  ```bash
  docker compose restart gitlab
  ```

## TODO
Check list [here](TODO.md)
