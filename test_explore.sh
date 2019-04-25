#!/bin/bash

echo "start"

{
	gnome-terminal -t "XXD_ros" -x bash -c "roscore;exec bash"
}&
 
sleep 1s
{
	gnome-terminal -t "robot" -x bash -c "source ~/catkin_navigation/devel/setup.bash;roslaunch turtlebot_k2_exploration_3d turtlebot_gmapping.launch;exec bash"
}&
 
sleep 7s 
{
	gnome-terminal -t "map" -x bash -c "source ~/catkin_navigation/devel/setup.bash;rosrun turtlebot_k2_exploration_3d turtlebot_exploration_3d;exec bash"	
}&

sleep 5s
{
	gnome-terminal -t "rviz" -x bash -c "source ~/catkin_navigation/devel/setup.bash;roslaunch turtlebot_k2_exploration_3d exploration_rviz.launch;exec bash"
}
 
