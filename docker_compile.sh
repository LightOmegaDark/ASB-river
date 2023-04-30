docker run \
    --rm \
    --name asb_compile \
    --mount type=bind,source=/mnt/d/HorizonXI/Server/AirSkyBoat,target=/asb \
    -v asb_mysql_data:/var/lib/mysql \
    --entrypoint "" \
    -w /asb -it asb \
    /bin/bash -c 'mkdir -p build && cd build && \
    cmake .. && make clean && make -j $(nproc)'
