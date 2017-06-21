FROM ubuntu:16.04

MAINTAINER a2ncer@gmail.com

RUN apt-get update && \
	apt-get install -y git cmake build-essential libboost-all-dev && \
	git clone -b Linux https://github.com/nicehash/nheqminer.git && \
	cd nheqminer/cpu_xenoncat/Linux/asm/ && \
	sh assemble.sh && \
	cd ../../../Linux_cmake/nheqminer_cpu && \
	cmake . && \
	make -j $(nproc) && \
	cp nheqminer_cpu /bin && \
	nhqminer_cpu -h

ENTRYPOINT ["nhqminer_cpu"]
	
