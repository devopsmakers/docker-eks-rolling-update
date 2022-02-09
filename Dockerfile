ARG ALPINE_K8S_VERSION=1.20.7
FROM alpine/k8s:${ALPINE_K8S_VERSION}

ARG EKS_ROLLING_UPDATE_VERSION=1.1.8

ENV PYTHONUNBUFFERED=1
ENV AWS_DEFAULT_REGION=eu-west-1

# Installing required packages
# RUN pip3 install --no-cache --upgrade eks-rolling-update==${EKS_ROLLING_UPDATE_VERSION}

RUN pip3 install --no-cache --upgrade build git+https://github.com/hellofresh/eks-rolling-update.git@70306efbf8d9a6c587d8f82af60d995827122537
