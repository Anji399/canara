FROM ubuntu:22.04
RUN apt-get -y update && apt-get -y upgrade && \
    apt-get -y install openjdk-11-jdk wget && \
    mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.97/bin/apache-tomcat-8.5.97.tar.gz
RUN cd /tmp && tar xvfz tomcat-8.5.97.tar.gz && cp -Rv /tmp/apache-tomcat-8.5.97/* /usr/local/tomcat/
COPY target/canara.war /usr/local/tomcat/webapps/canara.war
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

# build the image:  docker build -t mpr:1 .
# run the image : docker run -d -p 8080:8080 --name mpr mpr:1
# access it by : <ip>:8080
