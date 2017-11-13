#!/bin/sh -xe

if [ "$GITBUCKET_DB_URL" -a "$GITBUCKET_DB_USER" -a "$GITBUCKET_DB_PASSWORD" ]; then
  cat > /gitbucket/database.conf <<-EOCONF
db {
  url = "$GITBUCKET_DB_URL"
  user = "$GITBUCKET_DB_USER"
  password = "$GITBUCKET_DB_PASSWORD"
}
EOCONF
fi

if [ "$GITBUCKET_CERT" ]; then
  TARGET_TLS_PATH=$JAVA_HOME/lib/security/cacerts
  # another container may creates cert
  timeout=0
  while [ ! -f $GITBUCKET_CERT -a $timeout -lt 60 ]
  do
    timeout=`expr $timeout + 1`
    sleep 1
    echo Waiting for $GITBUCKET_CERT ....
  done
  if [ -f $GITBUCKET_CERT ]; then
    echo Getting ready $GITBUCKET_CERT to $TARGET_TLS_PATH
    echo yes | keytool -import -trustcacerts -storepass 'changeit' -alias sambacert -file $GITBUCKET_CERT -keystore $TARGET_TLS_PATH
    keytool -list -storepass 'changeit' -keystore $TARGET_TLS_PATH
  fi
fi

exec java $JAVA_OPTS -jar /opt/gitbucket.war $GITBUCKET_OPTS
