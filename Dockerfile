FROM google/cloud-sdk:alpine

RUN apk add --update make ca-certificates openssl && update-ca-certificates && rm /var/cache/apk/*

# Installing missing kubectl
RUN gcloud components install --quiet kubectl alpha beta gsutil cloud_sql_proxy && rm -rf /google-cloud-sdk/.install/.backup/ && rm /google-cloud-sdk/bin/kubectl.*

# Getting Helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > gethelm.sh
RUN bash gethelm.sh && rm gethelm.sh

# Installing plugins
RUN helm init -c
RUN helm plugin install https://github.com/hayorov/helm-gcs
RUN helm plugin install --version master https://github.com/sagansystems/helm-github.git
RUN helm plugin install https://github.com/hypnoglow/helm-s3.git
