# docker-tor-obfs4-bridge
Remix of https://dip.torproject.org/torproject/anti-censorship/docker-obfs4-bridge including some refactoring and docker-compose support.

*Basics*:
* clone repo
* edit _tor-bridge.conf_ (which is linked to the _.env_ file environment import)
  * OR and PT TCP-Ports need to be reachable from the outside world
  * Nickname is optional
  * Mail is highly recommended to give the project an option to reach out
* build it using docker-compose build --pull -> run it using docker-compose up -d

*Other Stuff*:
* Use ```docker exec CONTAINER_ID get-bridge-line``` to display your bridge line. It can be directly consumed by tor clients to contact your bridge.
* Get some logs: ```docker logs CONTAINER_ID```

*Aftermath*:
* Check out https://community.torproject.org/relay/setup/bridge/post-install/
