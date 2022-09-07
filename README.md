# omping-docker

Dockerized Multicasting diagnostic tool - useful for debugging connectivity issues with ROS 2

[![Build/Publish Docker Image](https://github.com/husarion/omping-docker/actions/workflows/build.yaml/badge.svg)](https://github.com/husarion/omping-docker/actions/workflows/build.yaml)

## Quick start

To check whether multicasting connectivity works between two hosts run:

```bash
docker run --rm -it --net host husarion/omping 172.20.10.2 172.20.10.3
```

where `172.20.10.2` and `172.20.10.3` are addresses of the hosts (replace by your hosts IP addresses).

## Output

### Healthy output (multicasting works)

```
$ docker run --rm -it --net host husarion/omping omping 172.20.10.2 172.20.10.3
172.20.10.2 : waiting for response msg
172.20.10.2 : joined (S,G) = (*, 232.43.211.234), pinging
172.20.10.2 :   unicast, seq=1, size=69 bytes, dist=0, time=21.463ms
172.20.10.2 : multicast, seq=1, size=69 bytes, dist=0, time=21.737ms
172.20.10.2 :   unicast, seq=2, size=69 bytes, dist=0, time=8.351ms
172.20.10.2 : multicast, seq=2, size=69 bytes, dist=0, time=8.614ms
172.20.10.2 :   unicast, seq=3, size=69 bytes, dist=0, time=9.578ms
172.20.10.2 : multicast, seq=3, size=69 bytes, dist=0, time=9.956ms
172.20.10.2 :   unicast, seq=4, size=69 bytes, dist=0, time=12.393ms
172.20.10.2 : multicast, seq=4, size=69 bytes, dist=0, time=12.649ms
172.20.10.2 :   unicast, seq=5, size=69 bytes, dist=0, time=11.433ms
```

### Broken multicasting output

```
$ docker run --rm -it --net host husarion/omping omping 172.20.10.2 172.20.10.3
172.20.10.2 : waiting for response msg
172.20.10.2 : joined (S,G) = (*, 232.43.211.234), pinging
172.20.10.2 :   unicast, seq=1, size=69 bytes, dist=0, time=21.463ms
172.20.10.2 :   unicast, seq=2, size=69 bytes, dist=0, time=8.351ms
172.20.10.2 :   unicast, seq=3, size=69 bytes, dist=0, time=9.578ms
172.20.10.2 :   unicast, seq=4, size=69 bytes, dist=0, time=12.393ms
172.20.10.2 :   unicast, seq=5, size=69 bytes, dist=0, time=11.433ms
172.20.10.2 :   unicast, seq=6, size=69 bytes, dist=0, time=12.826ms
172.20.10.2 :   unicast, seq=7, size=69 bytes, dist=0, time=12.494ms
172.20.10.2 :   unicast, seq=8, size=69 bytes, dist=0, time=82.537ms
```