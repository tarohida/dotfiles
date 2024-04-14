#!/bin/bash
gcloud-wrapper () {
    if [ "$1" = "switch" ]; then
        gcloud config set project "$2"
    elif [ "$1" = "list" ]; then
        if [ "$2" = "instances" ]; then
            gcloud compute instances list
        elif [ "$2" = "ip" ]; then
            gcloud compute instances list --format="table(NAME,EXTERNAL_IP)" --filter="EXTERNAL_IP:*"
        fi
    elif [ "$1" = "start" -o "$1" = "up" ]; then
        gcloud compute instances start $2
    elif [ "$1" = "stop" ]; then
        gcloud comupte instances stop $2
    else
        gcloud "$@"
    fi
}

gcloud-create-instance() {
    name=$1
    image_project=$2
    image_family=$3
    gcloud compute instances create $name \
    --boot-disk-auto-delete \
    --boot-disk-size=20GB \
    --boot-disk-type=pd-standard \
    --zone=asia-northeast2-a \
    --image-project="$image_project" \
    --image-family="$image_family" \
    --machine-type=n1-standard-1
}

gcloud-create-rocky9() {
    suffix=$1
    gcloud-create-instance rocky9-$1-"$(date '+%Y%m%d%H%M%S')" rocky-linux-cloud rocky-linux-9
}

alias gcloud="gcloud-wrapper"