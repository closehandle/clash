FROM debian:latest

ADD clash /usr/bin/clash

RUN mkdir /usr/share/clash
ADD https://raw.githubusercontent.com/closehandle/ipip2mmdb/release/Country.mmdb /usr/share/clash/Country.mmdb

CMD ["bash", "docker-entrypoint.sh"]
