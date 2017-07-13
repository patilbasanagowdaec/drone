
Below are the instructions for build

In the shell go to the location where the java project  is been present
cd /Users/bapatil/Documents/workspace-sts-3.8.4.RELEASE/drone

Execute below commands for building docker image and running the image

 docker build --help
 docker build -f Dockerfile -t dronedocker .
 docker images

For pushing the image to docker hub which is publicly available
 docker login
	basanagowda
	passwordofdocker
 docker tag dronedocker basanagowda/dronedocker
 docker push basanagowda/dronedocker

For running Docker which will create container
 docker run -p 8080:8080 dronedocker

docker ps
docker stop b13ada0b16f3

