FROM google/cloud-sdk:alpine

RUN apk add --update make ca-certificates openssl

RUN update-ca-certificates

# Installing missing kubectl
RUN gcloud components install --quiet kubectl

# Getting Helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > gethelm.sh
RUN bash gethelm.sh
