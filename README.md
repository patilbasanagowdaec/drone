
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


Docker file will look as below

FROM openjdk:8

# Set the jar file name variable.  Update this to change the app name used.
ENV JARFILE drone-0.0.1.jar

# Add the application binary to the docker image
ADD target/$JARFILE /tmp/$JARFILE
RUN chmod 755 /tmp/$JARFILE

# Execute Application
#RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /tmp/$JARFILE" ]



Now we will see how can we integrate with Drone for CI

For Drone to work we have to configure our github account and our application.
Presently we are using the drone running in docker instance
Need to configure oauth settings in github

If the IP is getting changes then we should make the corresponding change in github. Then only we will be able to access
the drone.
