FROM alpine:3.8
RUN apk update
RUN apk add xmlrpc-c-dev curl-dev git util-linux-dev linux-headers autoconf automake libtool clang g++ make gsl-dev libpcap-dev libffi-dev
RUN git clone https://github.com/flowgrind/flowgrind
RUN cd flowgrind &&  autoreconf -i && ./configure && make CFLAGS=-DHAVE_TCP_CA_STATE=1 && make install
EXPOSE 5999

CMD ["/usr/local/sbin/flowgrindd", "-d"]
