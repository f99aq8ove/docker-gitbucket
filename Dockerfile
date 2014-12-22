FROM ubuntu

MAINTAINER f99aq8ove <f99aq8ove [at] gmail.com>

RUN apt-get update
RUN apt-get install -q -y openjdk-7-jre-headless
RUN apt-get clean


ADD https://github.com/takezoe/gitbucket/releases/download/2.6/gitbucket.war /opt/gitbucket.war

RUN ln -s /gitbucket /root/.gitbucket

VOLUME /gitbucket
EXPOSE 8080

CMD ["java", "-jar", "/opt/gitbucket.war"]
