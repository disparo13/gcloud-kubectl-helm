FROM google/cloud-sdk:alpine

RUN apk add --update make ca-certificates openssl && update-ca-certificates && rm /var/cache/apk/*

# Installing missing kubectl
RUN gcloud components install --quiet kubectl alpha beta gsutil cloud_sql_proxy && rm -rf /google-cloud-sdk/.install/.backup/ && rm /google-cloud-sdk/bin/kubectl.*

# Getting Helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > gethelm.sh
RUN bash gethelm.sh && rm gethelm.sh
