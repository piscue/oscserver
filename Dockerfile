FROM ubuntu:bionic
RUN mkdir /app \
 && apt-get update && apt-get install -y make git g++
WORKDIR /app
RUN git clone https://github.com/techtim/oscpack \
 && git clone https://github.com/RossBencina/oscgroups
WORKDIR /app/oscpack
RUN make
WORKDIR /app/oscgroups
RUN make
WORKDIR /app/oscgroups/bin
EXPOSE 22242
ENTRYPOINT ./OscGroupServer
