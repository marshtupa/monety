# Установка СУБД PostgreSQL 

```bash
docker run \
    --name monety \
    -p 5555:5432 \
    -e POSTGRES_USER=marshtupa \
    -e POSTGRES_PASSWORD=passwd \
    -e POSTGRES_DB=monety \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -d -v "$HOME"/monety/docker:/var/lib/postgresql/data \
    postgres:14
```

![connection.png](/docker/connection.png)