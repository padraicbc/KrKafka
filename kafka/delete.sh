

kubectl delete -f "`dirname $0`/files/kafka-kraft.yaml" -n kafka 
kubectl delete -f "`dirname $0`/files/strimzi-setup.yaml" -n kafka

kubectl delete namespace kafka
