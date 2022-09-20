FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
COPY /home/ansadmin/workspace/proj1/webapp/target/*.war /usr/local/tomcat/webapps

