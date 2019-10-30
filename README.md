# Building the core image (keepalived-core)
    cd core
    make

# Building the image (keepalived)
    make

# Setting up the test
    make network (one-time)
    make autoheal
    make run

# Testing
    docker exec -it lbtester bash
        apt-get update
        apt-get install inetutils-ping
        ping 10.5.0.10

    docker stop lb1
    docker stop lb2
    etc.