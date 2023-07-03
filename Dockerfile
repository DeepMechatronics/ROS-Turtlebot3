FROM osrf/ros:kinetic-desktop-full

# Upgrade packages and install some tools
RUN apt-get update && apt-get -y upgrade && apt-get install -y \
    python-rosdep \
    python-catkin-tools \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get install ros-kinetic-joy ros-kinetic-teleop-twist-joy \
  ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc \
  ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan \
  ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python \
  ros-kinetic-rosserial-server ros-kinetic-rosserial-client \
  ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server \
  ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro \
  ros-kinetic-compressed-image-transport ros-kinetic-rqt* \
  ros-kinetic-gmapping ros-kinetic-navigation ros-kinetic-interactive-markers \ 
  ros-kinetic-dynamixel-sdk \
  ros-kinetic-turtlebot3-msgs \
  ros-kinetic-turtlebot3
# Clone the source code
#WORKDIR /sim_ws
#COPY src ./src

RUN echo "export TURTLEBOT3_MODEL=waffle_pi" >> ~/.bashrc

# Install dependencies
RUN apt-get update \
  && rosdep update \
  && rosdep install --from-paths src -iy \
  && rm -rf /var/lib/apt/lists/*

# Build the workspace
# RUN catkin config --extend /opt/ros/melodic --install -i /opt/ros/leo-sim \
#  && catkin build --no-status

# Modify the entrypoint file
# RUN sed -i "s|\$ROS_DISTRO|leo-sim|" /ros_entrypoint.sh

# Run launch file
# CMD ["roslaunch", "leo_erc_gazebo", "leo_marsyard.launch"]
#
