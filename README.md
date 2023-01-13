
# Start minikube 

* minikube start --memory=8192 --cpus=3 --kubernetes-version=v1.23.1 --vm-driver=kvm2 -p kafka
 
 * To create the kafka cluster `bash kafka/start.sh`
 

* Run `go run cmd/producer/main.go` from one tab to produced
* And `go run cmd/consumer/main.go` in another to see it consumed

* Teardown  `bash kafka/delete.sh`

Consumer/Producer examples taken from [here](https://github.com/strimzi/client-examples/tree/main/go/sarama)
