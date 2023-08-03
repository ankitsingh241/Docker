# How to write a Dockerfile to setup Tomcat container

# we will follow these steps to make a container

# Pull centos from dockerhub              --> FROM
# Install Java                            --> RUN
# Create /opt/tomcat directory            --> RUN
# Change working directory to /opt/tomcat --> WORKDIR
# download tomcat packages                --> ADD
# Extract tar.gz file                     --> RUN
# Remane to tomcat directory              --> RUN
# Open ports 8080                         --> EXPOSE
# Start tomcat service                    --> CMD


FROM centos:latest
RUN yum install java -y
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.78.tar.gz
RUN mv apache-tomcat-9.0.78./* /opt/tomcat
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]





