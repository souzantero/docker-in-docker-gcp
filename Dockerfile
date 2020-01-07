###
# Docker GCP
#
# Repository:    Docker
FROM docker:latest

# Repository/Image Maintainer
LABEL maintainer="Antero, Felipe <souzantero@gmail.com>"

# Install GCP
RUN apk add --update \
    make \
    ca-certificates \
    openssl \
    python && \
    update-ca-certificates && \
    wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz && \
    tar zxvf google-cloud-sdk.tar.gz -C $HOME && $HOME/google-cloud-sdk/install.sh --usage-reporting=false --path-update=true && \
    $HOME/google-cloud-sdk/bin/gcloud --quiet components update && \
    $HOME/google-cloud-sdk/bin/gcloud components install kubectl