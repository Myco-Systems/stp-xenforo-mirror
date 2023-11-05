# Xenforo StP Repo

Github mirror:
https://github.com/Myco-Systems/stp-xenforo-mirror/

## Downloading and building (run as root or enable docker rootless)
```
curl -sSfL get.docker.com | bash
```
```
git clone https://git.myco.systems/stp/xenforo.git
```

```
cd xenforo
```

Copy .env.example to .env and fill in the relevant information, this should match the db you are importing from.
```
cp .env.example .env
```

Place xenforo files at xenforo/_data (or alter the directory in docker-compose.yml to match your Xenforo location) mysql can be pointed anywhere, but you should have a persistent directory so you can enter the container and import your db.

```
docker compose build
```

## Running

```
docker compose up -d 
```

To import your mysql db you need to move your .sql files into a location that the container is attached to then run `docker exec -it <docker-container-id> /bin/bash` > `cd /var/lib/mysql` (assuming this is the directory the container is attached to) > `mariadb -u <username> -p <db-name> < <your-existing-db>` enter your password and then get a coffee because any databases over 1 GB can take a while.

Restart the containers:
```
docker compose down && docker compose up
```
After that the nginx webserver will be running on port 8080, currently the expected behavior is for nginx to be behind a reverse proxy so either you can point the proxy at your-ip:8080 or you can alter the docker compose file to include traefik which can grab ssl certificates for you.

## Issues

### Github

To report an issue go to https://github.com/Myco-Systems/stp-xenforo-mirror/blob/main/ISSUES.md and copy the raw markdown, then head over to https://github.com/Myco-Systems/stp-xenforo-mirror/issues and press "New Issue"

### Gitea

To report an issue go to https://git.myco.systems/stp/xenforo/src/branch/main/ISSUES.md and copy the raw markdown, then head over to https://git.myco.systems/stp/xenforo/issues and press "New Issue"

## License

All code is licensed under MIT, no rights reserved, no warranty provided.
https://git.myco.systems/stp/xenforo/src/branch/main/LICENSE