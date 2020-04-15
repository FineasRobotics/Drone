## Table of Contents

- [Setup](#setup)
  - [Install Nvidia Docker](#install-nvidia-docker)
- [How to run](#how-to-run)
- [Workspace Structure](#workspace-structure)

---

### Setup

1. You need to have [ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu) installed.
2. Install [docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/), and make sure to also follow [post-installation steps](https://docs.docker.com/engine/install/linux-postinstall/).
   - If you have nvidia gpu, [Install Nvidia Docker](#install-nvidia-docker) too.
3. Create [a new catkin workspace](http://wiki.ros.org/catkin/Tutorials/create_a_workspace) and name it **drone_ws** (if you don't have one already).
4. To clone the files directly (without an extra folder), run inside the src folder:
   - `git init`
   - `git remote add origin git@gitlab.com:fineas-drone-team/drone-repo.git` (need to have SSH key to use this link)
   - `git fetch --all`
   - `git checkout development`
   - `git submodule update --init --recursive`
5. Build docker drone image: `docker build -t drone .`

---

### Install Nvidia Docker

Make sure you have Docker v.19.03 or later installed.

1. Install [latest Nvidia proprietary drivers](https://www.nvidia.com/Download/index.aspx) (may require to disable secure boot in bios settings).
2. Install Nvidia docker:
  ```
  distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \\
  curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \\
  curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list \\
  sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit \\
  sudo systemctl restart docker \\
  ```
3. Restart system
4. (Optional) Run:
    - `nvidia-smi` to check if the drivers are installed correctly.
    - `docker run --gpus all nvidia/cuda:10.0-base nvidia-smi` to check that hardware acceleration is working.

---

### How to run

1. Run image:

   ```
   docker run --gpus all -it --privileged \\
       -v *path to the ws*/drone_ws/:/home/user/drone_ws:rw \\
       -v /tmp/.X11-unix:/tmp/.X11-unix:ro \\
       -e LOCAL_USER_ID="$(id -u)" \\
       -e DISPLAY=${DISPLAY} \\
       -p 14570:14570/udp \\
       --name=drone drone /bin/bash
   ```

   - If you don't have nvidia gpu, remove the `--gpus all` part.
   - Make sure you update the `*path to the ws*/drone_ws/` with the right path!
2. From inside docker, find Firmware directory and run:  
    - `make px4_sitl gazebo` or
    - `make px4_sitl_default jmavsim` depending on what you want to run.

---

### Workspace Structure

```
│
├── drone_ws   <----------- Make sure it is named drone_ws!
│   ├── build
│   ├── devel
│   └── src     <----------- Our repo goes in here!
│       ├── CMakeLists.txt
│       ├── README.md
│       ├── Dockerfile
│       ├── Firmware
│       └──  .gitignore
```
