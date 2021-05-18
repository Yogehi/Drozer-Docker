FROM ubuntu:xenial-20160818
COPY install /tmp
RUN apt-get update && \
	apt-get install \
		python \
		python-pip \
		python-protobuf \
		python-openssl \
		python-twisted \
		python-yaml \
		git \
		protobuf-compiler \
		-y
RUN git clone https://github.com/mwrlabs/drozer/ /tmp/drozer
RUN mkdir /opt/java
RUN tar -zxf /tmp/jdk-7u80-linux-x64.tar.gz -C /opt/java
RUN export "JAVA_HOME=/opt/java/jdk1.7.0_80/" && \
	export "PATH=$JAVA_HOME/bin:$PATH" && \
	cd /tmp/drozer && \
	make deb
RUN dpkg -i /tmp/drozer/dist/drozer*.deb
RUN echo "[executables]" > /root/.drozer_config
RUN echo "java = /opt/java/jdk1.7.0_80/" >> /root/.drozer_config
