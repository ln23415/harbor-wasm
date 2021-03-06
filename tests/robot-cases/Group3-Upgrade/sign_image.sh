#!/bin/bash
set -x
set -e

echo "registry:"$5
echo "repo:"$6
docker pull $5/$6/$3:$4

IP=$1
PASSHRASE='Harbor12345'

echo $IP

mkdir -p /etc/docker/certs.d/$IP/
mkdir -p ~/.docker/tls/$IP:4443/

cp /harbor/ca/ca.crt /etc/docker/certs.d/$IP/
cp /harbor/ca/ca.crt ~/.docker/tls/$IP:4443/

export DOCKER_CONTENT_TRUST=1
export DOCKER_CONTENT_TRUST_SERVER=https://$IP:4443

export NOTARY_ROOT_PASSPHRASE=$PASSHRASE
export NOTARY_TARGETS_PASSPHRASE=$PASSHRASE
export NOTARY_SNAPSHOT_PASSPHRASE=$PASSHRASE
export DOCKER_CONTENT_TRUST_ROOT_PASSPHRASE=$PASSHRASE
export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE=$PASSHRASE
export DOCKER_CONTENT_TRUST_OFFLINE_PASSPHRASE=$PASSHRASE
export DOCKER_CONTENT_TRUST_TAGGING_PASSPHRASE=$PASSHRASE

docker login -u admin -p Harbor12345 $IP
docker tag $5/$6/$3:$4 $IP/$2/$3:$4
docker push $IP/$2/$3:$4
rm -rf /key_store/*
umask 077; tar -zcvf /key_store/private_keys_backup.tar.gz ~/.docker/trust/private; umask 022