FROM debian:latest

RUN apt update
RUN apt dist-upgrade -y
RUN apt autoremove --purge -y
RUN apt install ca-certificates -y

ADD clash /usr/bin/clash

RUN mkdir /usr/share/clash
ADD yacd  /usr/share/clash/yacd
ADD https://raw.githubusercontent.com/closehandle/ipip2mmdb/release/Country.mmdb /usr/share/clash/Country.mmdb

CMD ["bash", "docker-entrypoint.sh"]
