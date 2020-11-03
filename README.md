# Drozer-Docker

Docker image to run the Drozer computer client. This Docker image runs an older version of Ubuntu and Python2.

NOTE: You'll need to download Java 7 (`jdk-7u80-linux-x64.tar.gz`) for Linux x64 machines. At the time of this document's writing, Java 7 can be downloaded here: https://www.oracle.com/java/technologies/javase/javase7-archive-downloads.html

Place the downloaded `tar.gz` file into the `install` directory of this project. The resulting folder structure should look like this:

```
- Dockerfile
- install
  |
  - jdk-7u80-linux-x64.tar.gz
```

