docker build -t yantis/virtualgl .

xhost +si:localuser:$(whoami) >/dev/null
docker run \
  --privileged \
  --rm \
  -ti \
  -e DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -u docker \
  yantis/virtualgl /bin/bash -c "sudo initalize-graphics >/dev/null 2>/dev/null; vglrun glxspheres64;"
