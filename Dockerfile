FROM ghcr.io/graalvm/jdk:java17
LABEL author="Luis Michaelis"

RUN microdnf install iproute
RUN useradd -m -d /home/container container
RUN java -version

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

CMD ["/bin/bash", "/entrypoint.sh"]
