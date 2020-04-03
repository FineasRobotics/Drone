# Drone development
**Repo Hierarchy**
```
│
├── drone_ws
│   ├── .catkin_workspace
│   ├── build
│   ├── devel
│   └── src       <----------- We are here!
│       ├── CMakeLists.txt 
│       ├── README.md
│       ├── Dockerfile
│       ├── Firmware
│       ├── .git
│       ├── .gitignore
│       └── .gitmodules
```

## Instalation Guide
- Install [docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- Download and build the image using `docker build .`
- Run image <code> docker run -it --privileged \
    -v *path to the ws*/drone_ws/:/home/user/drone_ws:rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e LOCAL_USER_ID="$(id -u)" \
    -e DISPLAY=${DISPLAY} \
    -p 14570:14570/udp \
    --name=drone drone /bin/bash
    </code>
    **Don't forget to update the local path(.../src/Firmware) to the corresponding location on your host!**
- Test the PX4's default simulations and make sure everything's working. 
- JMavSim: `make px4_sitl_default jmavsim`
- Gazebo: `make px4_sitl gazebo`
