ubreu/tomcat
===================
Base docker image to run a Tomcat 7.0.x application server running on Oracle JDK8.
Extend from this dockerfile to create your own container. The base image contains an ONBUILD instruction to add any war files located in the build directory to Tomcat's webapps directory.

Usage
-----

Dockerfile:

    FROM ubreu/tomcatdocker

To create your image execute the following command on the tutum-docker-tomcat folder:

    docker build -t <yourrepository> .

To run the image and bind to port :

    docker run -d -p 8080:8080 <yourrepository>


