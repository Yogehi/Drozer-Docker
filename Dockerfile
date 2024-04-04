FROM ubuntu:jammy-20240227
RUN apt-get update && \
	apt-get install \
		python3 \
		python3-pip \
		python3-protobuf \
		python3-openssl \
		python3-twisted \
		python3-yaml \
		python3-distro \
		git \
		protobuf-compiler \
		libexpat1 \
		libexpat1-dev \
		libpython3-dev \
		python-is-python3 \
		zip \
		default-jdk \
		-y
RUN pip install --upgrade pip
RUN pip install --upgrade protobuf
RUN pip install --upgrade twisted
RUN git clone https://github.com/WithSecureLabs/drozer /tmp/drozer
RUN cd /tmp/drozer && \
	python setup.py bdist_wheel && \
	pip install ./dist/drozer*