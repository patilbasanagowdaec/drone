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
