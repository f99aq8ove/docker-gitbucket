FROM openjdk:jre

MAINTAINER f99aq8ove <f99aq8ove [at] gmail.com>

ENV GITBUCKET_VER 4.27.0
ENV GITBUCKET_EXTRA_DEPS "git procps"

ADD https://github.com/gitbucket/gitbucket/releases/download/$GITBUCKET_VER/gitbucket.war /opt/gitbucket.war

RUN apt-get update && apt-get upgrade -y && apt-get install --no-install-recommends -y \
    graphviz \
    && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

COPY gitbucket.sh /opt/gitbucket.sh

RUN ln -s /gitbucket /root/.gitbucket

VOLUME /gitbucket

# Port for web page
EXPOSE 8080
# Port for SSH access to git repository (Optional)
EXPOSE 29418

CMD ["/opt/gitbucket.sh"]
