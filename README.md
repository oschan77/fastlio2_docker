## Setup
1. Install Docker
2. git clone https://github.com/oschan77/fastlio2_docker.git
3. cd fastlio2_docker/
4. sudo chmod +x run_container.sh rosbag2pcd.sh test.sh
5. ./run_container.sh

## Rosbag to PCD (Velodyne)
1. Put rosbag file inside fastlio2_docker/docker_ws/BAG
2. ./rosbag2pcd_vld.sh rosbag_file_name.bag rosbag_play_speed
3. The output PCD file is in fastlio2_docker/docker_ws/PCD


## Rosbag to PCD (Ouster OS1-32-U)
1. Put rosbag file inside fastlio2_docker/docker_ws/BAG
2. ./rosbag2pcd_otr32.sh rosbag_file_name.bag rosbag_play_speed
3. The output PCD file is in fastlio2_docker/docker_ws/PCD