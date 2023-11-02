FROM debian:latest

RUN apt update
RUN apt install dnsutils -y
RUN apt install iproute2 -y
RUN apt install iptables -y
RUN apt install net-tools -y

ADD clash /usr/bin/clash
ADD docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

RUN mkdir /var/lib/clash
ADD https://raw.githubusercontent.com/closehandle/ipip2mmdb/release/Country.mmdb /var/lib/clash/Country.mmdb

CMD ["bash", "docker-entrypoint.sh"]
