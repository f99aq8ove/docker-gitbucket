FROM openjdk:jre-alpine

MAINTAINER f99aq8ove <f99aq8ove [at] gmail.com>

ADD https://github.com/gitbucket/gitbucket/releases/download/4.19.2/gitbucket.war /opt/gitbucket.war

RUN apk add --no-cache ttf-dejavu git

COPY gitbucket.sh /opt/gitbucket.sh

RUN ln -s /gitbucket /root/.gitbucket

VOLUME /gitbucket

# Port for web page
EXPOSE 8080
# Port for SSH access to git repository (Optional)
EXPOSE 29418

CMD ["/opt/gitbucket.sh"]
