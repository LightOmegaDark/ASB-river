# Docker

Managing ASB in Docker

# Prereq

You must have Docker installed. Follow the appropriate guide for your operating system.

# Build Docker image

Before you can launch the Docker container you must build the image. The image is built from [Dockerfile](Dockerfile). You can build the image using [docker_build.sh](docker_build.sh).

# Compile executables

Before you run the container you must build the server binaries. The container mounts the local source directory and will output the compiled binaries to your local source directory. We compile with this step rather than the build step because it is faster for development to not rebuild the entire container.

If you make changes to the source you must also recompile.

Compile the binaries using [docker_compile.sh](docker_compile.sh)

# Setup database and other database related tasks

If this is a new server, you must first setup the database. ASB documentation refers you to [LandSandBoat Quickstart](https://github.com/LandSandBoat/server/wiki/Quick-Start-Guide) but the jist is to run

```
mysql_secure_installation
sudo mysql -u root -p -e \
    "CREATE USER 'XI_USER'@'localhost' IDENTIFIED BY 'XI_PASSWORD'; \
     CREATE DATABASE xidb; \
     USE xidb; \
     GRANT ALL PRIVILEGES ON xidb.* TO 'XI_USER'@'localhost';"
python3 tools/dbtool.py
```

To open a db console use [docker_dbtool.sh](docker_dbtool.sh). If the `xidb` database does not exist it will give you a shell which you can use to run the above commands. If the database does exist it will give you a `dbtool.py` shell.

The database is stored in a docker volume `asb_mysql_data` which persists between restarts.

To take a database backup, simple use `docker_dbtool.sh` and the backup will be created in `sql/backups`.

# Running your container

To run your container use [docker_run.sh](docker_run.sh). To stop your container use [docker_stop.sh](docker_stop.sh). When the container is started it runs [docker_entrypoint.sh](docker_entrypoint.sh). Use [docker_logs.sh](docker_logs.sh) to follow the server process logs. Finally, use [docker_stop.sh](docker_stop.sh) to stop the container.

A restart of the server would look like this.
```
./docker_stop.sh
./docker_start.sh
```

The server TCP and UDP ports are forwarded to the docker host.