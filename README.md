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
- Download and build the image using `docker build -t drone .`
- Run image <code> docker run -it --privileged \\
    -v *path to the ws*/drone_ws/:/home/user/drone_ws:rw \\
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \\
    -e LOCAL_USER_ID="$(id -u)" \\
    -e DISPLAY=${DISPLAY} \\
    -p 14570:14570/udp \\
    --name=drone drone /bin/bash
    </code>
    **Don't forget to update the local path(.../src/Firmware) to the corresponding location on your host!**
- Test the PX4's default simulations and make sure everything's working. 
- JMavSim: `make px4_sitl_default jmavsim`
- Gazebo: `make px4_sitl gazebo`

##For Nvidia graphics cards:

- Install [docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/) v.19.03.
- Install [latest Nvidia proprietary drivers](https://www.nvidia.com/Download/index.aspx) (may require to disable secure boot in bios settings).
- Install Nvidia docker:
    `distribution=$(. /etc/os-release;echo $ID$VERSION_ID)`
    `curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -`
    `curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list`

    `sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit`
    `sudo systemctl restart docker`
- Restart system
- Optional: 
    run `nvidia-smi` to check if the drivers are installed correctly.
    run `docker run --gpus all nvidia/cuda:10.0-base nvidia-smi` to check that hardware acceleration is working
- Download and build the image using `docker build -t drone .`
- Enable xhost using `xhost +`
- Run image <code> docker run --gpus all -it --privileged \\
    -v *path to the ws*/drone_ws/:/home/user/drone_ws:rw \\
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \\
    -e LOCAL_USER_ID="$(id -u)" \\
    -e DISPLAY=${DISPLAY} \\
    -p 14570:14570/udp \\
    --name=drone drone /bin/bash
    </code>
    **Don't forget to update the local path(.../src/Firmware) to the corresponding location on your host!**
- Test the PX4's default simulations and make sure everything's working. 
- JMavSim: `make px4_sitl_default jmavsim`
- Gazebo: `make px4_sitl gazebo`
