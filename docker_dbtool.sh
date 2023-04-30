docker run \
    --rm \
    --name asb_dbtool \
    --mount type=bind,source=/mnt/d/HorizonXI/Server/AirSkyBoat,target=/asb \
    -v asb_mysql_data:/var/lib/mysql \
    --entrypoint "" \
    -w /asb -it asb \
    /bin/bash -c "service mariadb start && \
    /usr/bin/python3 /asb/tools/dbtool.py || \
    /bin/bash"
