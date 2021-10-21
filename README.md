# Drozer-Docker

Docker container to run the Drozer computer client. This Docker container runs an older version of Ubuntu and Python2.

## Setup

You'll need to download Java 7 (`jdk-7u80-linux-x64.tar.gz`) for Linux x64 machines. At the time of this document's writing, Java 7 can be downloaded here: https://www.oracle.com/java/technologies/javase/javase7-archive-downloads.html

Place the downloaded `tar.gz` file into the `install` directory of this project. The resulting folder structure should look like this:

```
- Dockerfile
- install
  |
  - jdk-7u80-linux-x64.tar.gz
```

## Build and Install

If you want to build this container yourself, use the `docker build` command to build the Docker container:

`docker build -t yogehi/drozer_docker .`

Alternatively, use the pre-built Docker container at https://hub.docker.com/r/yogehi/drozer_docker:

`docker pull yogehi/drozer_docker`

## Run and Connect

#Option 1: connect to the phone via network

First, obtain a shell into the container:

`docker run -it yogehi/drozer_docker`

Then run the Drozer command to connect to the phone:

`drozer console connect --server <phone IP address>`

#Option 2: connect to the phone via USB

First, forward port 31415 to the phone via ADB:

`adb forward tcp:31415 tcp:31415`

Next, obtain a shell into the container while adding an address to the container's Hosts file:

`docker run -it --add-host host.docker.internal:host-gateway yogehi/drozer_docker`

Finally, connect to drozer:

`drozer console connect --server host.docker.internal`
