### Setup

1. You need [Ubuntu 18.04](http://releases.ubuntu.com/18.04.4/) with [ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu) installed.
2. Install packages `sudo apt-get install ros-melodic-gazebo-ros-pkgs ros-melodic-gazebo-ros-control ros-melodic-ros-control ros-melodic-ros-controllers`
3. Create a new catkin workspace if you don't have one already.
4. To clone the files directly (without an extra folder), run inside the src folder:
    - `git init`
    - `git remote add origin https://gitlab.com/fineas-drone-team/drone-repo.git`
    - `git fetch --all`
    - `git pull origin master`
5. Run `catkin_make`.
6. If it doesn't work install these too `sudo apt-get install ros-melodic-joint-state-controller ros-melodic-effort-controllers ros-melodic-position-controllers`

----

### How to run

1. Source the workspace(`source devel/setup.bash` or check our [ROS Basics](https://docs.google.com/document/d/1HTMq7Cwe4MZPlNUSJqRnfYy1TClEv3lscJfn8Ei_yrE/edit?usp=sharing) doc for more information).
2. Run: `roslaunch fly_bot Kwad_gazebo.launch`.
3. For the quadCopter to just hover in mid-air, open another terminal: `rosrun fly_bot control.py`.
4. For more info on fly_bot check [this](https://github.com/NishanthARao/ROS-Quadcopter-Simulation).

----

