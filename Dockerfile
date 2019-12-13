FROM ubuntu:16.04 As base

RUN apt-get update && \
	apt-get install -y build-essential && \
	apt-get -y install cmake && \
	apt-get install python3-pip -y && \
	apt-get install git -y

# This is a hack. Should use the official version
RUN git clone https://github.com/umarmohammed/cmakeconverter.git
WORKDIR cmakeconverter
RUN pip3 install .

ENTRYPOINT ["/bin/bash", "-c", "cmake-converter -p $projfile -i && cmake -DCMAKE_BUILD_TYPE=Release . && make"]
