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

`docker build -t kengannonmwr/drozer_docker .`

Alternatively, use the pre-built Docker container at https://hub.docker.com/r/kengannonmwr/drozer_docker:

`docker pull kengannonmwr/drozer_docker`

## Run and Connect

First, obtain a shell into the container:

`docker run -it kengannonmwr/drozer_docker`

Then run the Drozer command to connect to the phone:

`drozer console connect --server <phone IP address>`
