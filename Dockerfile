ARG ALPINE_K8S_VERSION=1.20.7
FROM alpine/k8s:${ALPINE_K8S_VERSION}

ARG EKS_ROLLING_UPDATE_VERSION=1.1.8

ENV PYTHONUNBUFFERED=1
ENV AWS_DEFAULT_REGION=eu-west-1

# Installing required packages
# RUN pip3 install --no-cache --upgrade eks-rolling-update==${EKS_ROLLING_UPDATE_VERSION}

RUN git clone https://github.com/hellofresh/eks-rolling-update.git && \
    cd eks-rolling-update && \ 
    git checkout 70306efbf8d9a6c587d8f82af60d995827122537 && \
    pip3 install --no-cache --upgrade boto3 kubernetes python-dotenv urllib3 && \
    ln -s $(pwd)/eks_rolling_update.py /usr/local/bin/eks_rolling_update.py && \
    eks_rolling_update.py -h