# Drone development
**Repo Hierarchy**
```
│
├── drone_ws
│   ├── .catkin_workspace
│   ├── build
│   ├── devel
│   └── src             <----- We are here!
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
- Run image <code> docker run -it --rm \
    -v /home/Fineas/drone_ws/src/Firmware:/home/user/Firmware:rw \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -e DISPLAY=${DISPLAY} \
    -e LOCAL_USER_ID="$(id -u)" \
    --name=px4_container px4io/px4-dev-ros-melodic /bin/bash
    </code>
    **Don't forget to update the local path(.../src/Firmware) to the corresponding location on your host!**
- Test the PX4's default simulations and make sure everything's fine. `make px4_sitl_default jmavsim` and `make px4_sitl gazebo`.
