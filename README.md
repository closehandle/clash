# clash
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
    --detach \
    --volume /etc/clash/default.yml:/etc/clash.yml \
    --network macvlan \
    --restart always \
    --hostname clash \
    --privileged \
    --mac-address EE:EE:EE:EE:EE:EE \
    closehandle/clash:macvlan
```
