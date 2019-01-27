
docker run -p 8080:8080 -p 50000:50000 -v /home/rafael/docker_volumes:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock halfbreak:jenkins

docker exec -it -u root admiring_hertz bash

docker build -t "halfbreak:jenkins" .
