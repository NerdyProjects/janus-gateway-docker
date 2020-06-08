# Janus docker image

This provides a docker (+ compose) setup to run Janus WebRTC gateway.

Notice: This project has just started development and should not yet be used in production.

# Running
For now, manually fire up the container with

```
docker-compose run janus bash
```

and start `/opt/janus/bin/janus` inside.

To run the example webserver, fire up a second shell in the same container. Then,

```
cd /opt/janus/share/janus/demos
python3 -m http.server 8000
```

Now, you can visit the IP of the container on port 8000 and try out the examples.

Hint: For the streaming examples, you need to post RTP audio/video streams to ports 5002 and 5004.

# Resources

The project follows installation instructions given at https://github.com/meetecho/janus-gateway with some inspiration from https://github.com/atyenoria/janus-webrtc-gateway-docker
