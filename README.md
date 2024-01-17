1. Install Docker
2. Clone this repo.
3. cd fastlio2_docker/
4. sudo chmod +x run_container.sh rosbag2pcd.sh test.sh
5. ./run_container.sh
6. Put rosbag file inside fastlio2_docker/docker_ws/BAG.
7. ./rosbag2pcd.sh rosbag_file_name.bag rosbag_play_speed
8. The output PCD file is in fastlio2_docker/docker_ws/PCD.
