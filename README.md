# Drozer-Docker

Docker container to run the Drozer computer client (version 3.0.1).

## Build and Install

If you want to build this container yourself, use the `docker build` command to build the Docker container:

`docker build -t yogehi/drozer_docker .`

Alternatively, use the pre-built Docker container at https://hub.docker.com/r/yogehi/drozer_docker:

`docker pull yogehi/drozer_docker`

## Run and Connect

### Option 1: connect to the device via network

First, obtain a shell into the container:

`docker run -it yogehi/drozer_docker`

Then run the Drozer command to connect to the phone:

`drozer console connect --server <phone IP address>`

### Option 2: connect to the device via USB / `adb` on Windows host (Docker Desktop)

First, forward port 31415 to the phone via `adb`:

`adb forward tcp:31415 tcp:31415`

Next, obtain a shell into the container while adding an address to the container's Hosts file:

`docker run -it --add-host host.docker.internal:host-gateway yogehi/drozer_docker`

Finally, connect to drozer:

`drozer console connect --server host.docker.internal`

### Option 3: connect to the device via USB / `adb` on Linux host (`docker` service) and have `adb` listen on all network interfacesss

First, forward port 31415 to the phone via `adb` and have `adb` listen on all interfaces:

`adb -a forward tcp:31415 tcp:31415`

Next, obtain a shell into the container while exposing 

`docker run -it --add-host host.docker.internal:host-gateway yogehi/drozer_docker`

Finally, connect to drozer:

`drozer console connect --server host.docker.internal`

### Option 4: connect to the device via USB / `adb` on Linux host (`docker` service) and mount the container's network interfaces to your host's network interfaces

First, forward port 31415 to the phone via `adb`:

`adb forward tcp:31415 tcp:31415`

Next, obtain a shell into the container while exposing 

`docker run -it --net host yogehi/drozer_docker`

Finally, connect to drozer:

`drozer console connect --server localhost`