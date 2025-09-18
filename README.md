# Sharded Users (Spring Boot, Postgres x4, Java 17)

This project demonstrates **hash-based sharding across 4 PostgreSQL databases** using **Apache ShardingSphere-JDBC** and Spring Boot  2.7 .

## What you get
- 4 Postgres containers via `docker-compose` (ports 54320–54323), each with a DB (`db1`..`db4`)
- ShardingSphere-JDBC routes by **`id`** using sharding-algorithm: **HASH_MOD**
- Simple REST API:
  - `POST /users` – create a user (`{"email":"a@b.com","name":"Alice"}`)
  - `GET /users/{id}` – fetch by id (**single-shard**)
   - `GET /health` – health check

## Prereqs
- Docker + Docker Compose
- Java 17+
- Maven 3.9+ (or use Docker to build)

## Run
1) Start databases:
```bash
docker compose up -d
```

2) Build & run the app:
```bash
./mvnw spring-boot:run   # if mvnw not executable: chmod +x mvnw
# or, if using system Maven:
mvn spring-boot:run
```

3) Test:
```bash
curl -X POST http://localhost:8080/users -H "Content-Type: application/json" -d '{"email":"alice@example.com","name":"Alice"}'
curl http://localhost:8080/health
```

## Notes
- Queries that **don't include the sharding key (`id`)** will be **broadcast** to all shards. Keep cross-shard lookups minimal in production (add a lookup cache or change shard key).
- All four DBs share the same schema; see `db/init.sql`.
