#!/bin/bash 

kubectl create namespace kafka


echo dirname $0
kubectl create -f "`dirname $0`/files/strimzi-setup.yaml" -n kafka
echo "Enabling KRaft..."
kubectl set env deployment/strimzi-cluster-operator STRIMZI_FEATURE_GATES=+UseStrimziPodSets,+UseKRaft -n kafka

kubectl apply -f "`dirname $0`/files/kafka-kraft.yaml" -n kafka 
echo "Waiting for cluster creation..."
kubectl wait kafka/my-cluster --for=condition=Ready --timeout=300s -n kafka 

# echo "Forwarding to nodeport..."
kubectl port-forward services/my-cluster-kafka-0 9092:9094 -n kafka
