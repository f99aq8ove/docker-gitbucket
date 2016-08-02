FROM java:jre-alpine

MAINTAINER f99aq8ove <f99aq8ove [at] gmail.com>

ADD https://github.com/gitbucket/gitbucket/releases/download/4.3/gitbucket.war /opt/gitbucket.war

RUN ln -s /gitbucket /root/.gitbucket

VOLUME /gitbucket

# Port for web page
EXPOSE 8080
# Port for SSH access to git repository (Optional)
EXPOSE 29418

CMD ["java", "-jar", "/opt/gitbucket.war"]
