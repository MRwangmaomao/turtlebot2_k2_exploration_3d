#!/bin/bash

echo "start"

{
	gnome-terminal -t "XXD_ros" -x bash -c "roscore;exec bash"
}&
 
sleep 1s
{
	gnome-terminal -t "robot" -x bash -c "source ~/catkin_navigation/devel/setup.bash;roslaunch turtlebot_k2_exploration_3d turtlebot_gmapping.launch;exec bash"
}&
 
sleep 6s 
{
	gnome-terminal -t "rviz" -x bash -c "source ~/catkin_navigation/devel/setup.bash;roslaunch turtlebot_k2_exploration_3d exploration_rviz.launch;exec bash"
}&

#add the map name that you need advertise
#sleep 5s
#{
#	gnome-terminal -t "map" -x bash -c "rosrun map_server map_server /home/wpr/catkin_navigation/src/#turtlebot_k2_exploration_3d/map/$1;exec bash"	
#}
