#!/bin/bash

BAG_NAME=$1
PLAY_SPEED=$2

docker exec fastlio2 /bin/bash -c "
  cd /home/mars_ugv/catkin_ws ;
  source devel/setup.bash ;
  roslaunch fast_lio mapping_velodyne.launch rviz:=false & echo \$! > /tmp/roslaunch.pid ;
"

sleep 5

docker exec fastlio2 /bin/bash -c "
  cd /home/mars_ugv/catkin_ws ;
  source devel/setup.bash ;
  cd /home/mars_ugv/docker_ws/BAG ;
  rosbag play ./$BAG_NAME -r $PLAY_SPEED ;
"

sleep 5

docker exec fastlio2 /bin/bash -c "
  kill -2 \$(cat /tmp/roslaunch.pid) ;
  while kill -0 \$(cat /tmp/roslaunch.pid) 2> /dev/null; do
    sleep 1
  done ;
"

curl --location 'http://192.168.10.82:8000/user/create_file?description=test&user_name=breeze_db9&map_name=breeze_db9_1' \
--header 'Connection: close' \
--header 'Keep-Alive: True' \
--header 'token: glpat-CMh8iws4reRKWyYyeGvT' \
--form 'file=@"./docker_ws/PCD/scans.pcd"'
