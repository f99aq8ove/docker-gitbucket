docker-gitbucket
================

Setup a container with [GitBucket](https://github.com/takezoe/gitbucket) installed.

## Usage

To run the container, do the following:

```
% docker run -d -p 8080:8080 -p 29418:29418 -v ${PWD}/gitbucket-data:/gitbucket f99aq8ove/gitbucket
```

You can see gitbucket running on http://localhost:8080/
You also see gitbucket data write out to "./gitbucket-data".

In order to access the git repository over SSH (port 29418), check settings below.

- GitBucket > Administration > System Settings > SSH access

Additional environment variables can be set as below.

Environment variable | Value | Example
---------------------|-------|--------
`GITBUCKET_DB_URL`, `GITBUCKET_DB_USER`, `GITBUCKET_DB_PASSWORD` | Database connection for MySQL or PostgreSQL. See [External database configuration](https://github.com/gitbucket/gitbucket/wiki/External-database-configuration). Defaults to H2. | `jdbc:postgresql://db/gitbucket`, `user`, `password`
`JAVA_OPTS`         | JavaVM options.     | `-Xmx1g`
`GITBUCKET_OPTS`    | GitBucket options.  | `--prefix=/gitbucket`
`GITBUCKET_CERT`    | LDAP Authentication certificate path.  Embed a certificate to container. See [LDAP Authentication Settings](https://github.com/gitbucket/gitbucket/wiki/LDAP-Authentication-Settings)  | `/var/lib/samba/private/tls/cert.pem`

## Building

To build the image, do the following:

```
% docker build github.com/f99aq8ove/docker-gitbucket
```

A prebuilt container is available in the docker index.

```
% docker pull f99aq8ove/gitbucket
```

## GitBucket's license
see https://github.com/takezoe/gitbucket
