#
# PX4 ROS development environment
#

FROM px4io/px4-dev-ros-melodic:2020-04-02
LABEL maintainer="Nuno Marques <n.marques21@hotmail.com>"

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
