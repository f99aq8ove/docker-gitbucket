FROM alpine

MAINTAINER f99aq8ove <f99aq8ove [at] gmail.com>

RUN apk --update add openjdk8-jre && rm -rf /var/cache/apk/*

ADD https://github.com/gitbucket/gitbucket/releases/download/3.11/gitbucket.war /opt/gitbucket.war

RUN ln -s /gitbucket /root/.gitbucket

VOLUME /gitbucket

# Port for web page
EXPOSE 8080
# Port for SSH access to git repository (Optional)
EXPOSE 29418

CMD ["java", "-jar", "/opt/gitbucket.war"]
