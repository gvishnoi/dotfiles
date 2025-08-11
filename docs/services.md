# Local Development Services

This setup uses Docker Compose to run common development services.

## Services Included
- **PostgreSQL** → Main relational database
- **pgAdmin** → Web-based PostgreSQL management UI
- **Redis** → In-memory key-value store

## Location
The Docker Compose configuration is in:
```
~/dev/services/compose.yml
```

## Commands
From `~/dev/services`:
```sh
make up          # Start services
make down        # Stop services
make logs        # Follow service logs
make nuke        # Stop and remove volumes (data will be lost)

make kafka-up
make kafka-down
kcat -b localhost:9092 -L
```

Or with raw Docker Compose:
```sh
docker compose -f compose.yml up -d
docker compose down
```

## Environment Variables
The `.env` file in `~/dev/services` contains version numbers, usernames, and passwords.
An `.env.example` template is provided — copy it to `.env` and edit as needed:
```sh
cp .env.example .env
```

**⚠ Do not commit `.env` to version control**.
