# Gitlab service

## Description
GitLab service integrated inside convenient docker environment

## Install
Create `.env` file from template:
```bash
cp .env{.example,}
```

Edit `.env` file:
```
vim .env
```

Generate root password:
```bash
./scripts/generate-root-password.sh
```

Run docker services:
```bash
docker compose up -d
```

Register gitlab runner:
```bash
./scripts/register-runner.sh
```

## Clean up installation
```bash
docker compose down -v
```

## Snippets
- Editing gitlab instance config
  ```bash
  docker compose exec -it gitlab editor /etc/gitlab/gitlab.rb
  ```

  ```bash
  docker compose restart gitlab
  ```

- Viewing gitlab instance logs
  ```bash
  docker compose logs gitlab -f
  ```

## TODO
Check list [here](TODO.md)
