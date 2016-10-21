NAME = minio
VERSION =	latest
VERSION_ALIASES =
TITLE =	Minio
DESCRIPTION =	Minio is an Amazon S3 compatible object storage server
SOURCE_URL =	https://github.com/scaleway-community/scaleway-minio
VENDOR_URL =	https://minio.io/
DEFAULT_IMAGE_ARCH =	x86_64

IMAGE_VOLUME_SIZE =	50G
IMAGE_BOOTSCRIPT = stable
IMAGE_NAME = Minio


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - https://j.mp/scw-builder | bash
-include docker-rules.mk
