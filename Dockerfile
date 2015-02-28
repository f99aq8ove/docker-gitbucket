FROM ubuntu

MAINTAINER f99aq8ove <f99aq8ove [at] gmail.com>

RUN apt-get update
RUN apt-get install -q -y openjdk-7-jre-headless
RUN apt-get clean


ADD https://github.com/takezoe/gitbucket/releases/download/2.8/gitbucket.war /opt/gitbucket.war

RUN ln -s /gitbucket /root/.gitbucket

VOLUME /gitbucket

# Port for web page
EXPOSE 8080
# Port for SSH access to git repository (Optional)
EXPOSE 29418

CMD ["java", "-jar", "/opt/gitbucket.war"]
