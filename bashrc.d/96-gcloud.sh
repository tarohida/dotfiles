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

alias gcloud="gcloud-wrapper"