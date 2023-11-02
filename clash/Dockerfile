FROM debian:latest

ADD clash /usr/bin/clash

RUN mkdir /var/lib/clash
ADD https://raw.githubusercontent.com/closehandle/ipip2mmdb/release/Country.mmdb /var/lib/clash/Country.mmdb

CMD ["clash", "-d", "/var/lib/clash", "-f", "/etc/clash.yml"]
