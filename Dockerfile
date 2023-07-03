FROM osrf/ros:noetic-desktop-full

# Upgrade packages and install some tools
RUN apt-get update && apt-get -y upgrade && apt-get install -y \
    python3-rosdep \
    python3-catkin-tools \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get install ros-noetic-joy ros-noetic-teleop-twist-joy \
  ros-noetic-teleop-twist-keyboard ros-noetic-laser-proc \
  ros-noetic-rgbd-launch ros-noetic-rosserial-arduino \
  ros-noetic-rosserial-python ros-noetic-rosserial-client \
  ros-noetic-rosserial-msgs ros-noetic-amcl ros-noetic-map-server \
  ros-noetic-move-base ros-noetic-urdf ros-noetic-xacro \
  ros-noetic-compressed-image-transport ros-noetic-rqt* ros-noetic-rviz \
  ros-noetic-gmapping ros-noetic-navigation ros-noetic-interactive-markers \
  ros-noetic-dynamixel-sdk \
  ros-noetic-turtlebot3-msgs \
  ros-noetic-turtlebot3
  
# Clone the source code
#WORKDIR /sim_ws
#COPY src ./src

RUN echo "export TURTLEBOT3_MODEL=waffle_pi" >> ~/.bashrc

# Install dependencies
# RUN apt-get update \
#  && rosdep update \
#  && rosdep install --from-paths src -iy \
#  && rm -rf /var/lib/apt/lists/*

# Build the workspace
# RUN catkin config --extend /opt/ros/melodic --install -i /opt/ros/leo-sim \
#  && catkin build --no-status

# Modify the entrypoint file
# RUN sed -i "s|\$ROS_DISTRO|leo-sim|" /ros_entrypoint.sh

# Run launch file
# CMD ["roslaunch", "leo_erc_gazebo", "leo_marsyard.launch"]
#
