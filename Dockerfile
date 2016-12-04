## -*- docker-image-name: "scaleway-community/minio:latest" -*-
FROM scaleway/golang:amd64-latest
# following 'FROM' lines are used dynamically thanks do the image-builder
# which dynamically update the Dockerfile if needed.
#FROM scaleway/golang:armhf-latest          # arch=armv7l
#FROM scaleway/ubuntu:arm64-latest          # arch=arm64
#FROM scaleway/ubuntu:i386-latest           # arch=i386
#FROM scaleway/ubuntu:mips-latest           # arch=mips

MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)

# Prepare rootfs for image-builder
RUN /usr/local/sbin/scw-builder-enter

# Install packages
RUN apt-get -q update \
 && apt-get -q -y upgrade \
 && apt-get install -y -q \
#   YOUR_PACKAGE
 && apt-get clean

RUN go get -ldflags "-X github.com/minio/minio/cmd.Version=2016-11-26T02:23:47Z -X github.com/minio/minio/cmd.ReleaseTag=RELEASE.2016-11-26T02-23-47Z -X github.com/minio/minio/cmd.CommitID=9625629fc7c4660912037ec3db684a3ad84dec32" github.com/minio/minio

# Clean rootfs from image-builder
RUN /usr/local/sbin/scw-builder-leave

EXPOSE 9000
CMD minio