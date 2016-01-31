FROM debian:jessie

MAINTAINER f99aq8ove <f99aq8ove [at] gmail.com>

RUN echo 'deb http://http.debian.net/debian jessie-backports main' >> /etc/apt/sources.list
RUN apt-get update && \
    apt-get upgrade -q -y && \
    apt-get install -t jessie-backports -q -y --no-install-recommends openjdk-8-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD https://github.com/gitbucket/gitbucket/releases/download/3.11/gitbucket.war /opt/gitbucket.war

RUN ln -s /gitbucket /root/.gitbucket

VOLUME /gitbucket

# Port for web page
EXPOSE 8080
# Port for SSH access to git repository (Optional)
EXPOSE 29418

CMD ["java", "-jar", "/opt/gitbucket.war"]
