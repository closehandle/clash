# clash
Clash in Docker Container

```
docker network create \
    --opt parent=br0 \
    --driver macvlan \
    --subnet 192.168.1.0/24 \
    --gateway 192.168.1.1 \
    macvlan
```

```
docker container run \
    -it \
    --ip 192.168.1.254 \
    --env TZ=Asia/Shanghai \
    --name clash \
    --pull always \
    --detach \
    --volume /etc/clash:/etc/clash \
    --volume /var/lib/clash:/var/lib/clash \
    --network macvlan \
    --restart always \
    --hostname clash \
    --privileged \
    --mac-address EE:EE:EE:EE:EE:EE \
    closehandle/clash:macvlan
```
