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
