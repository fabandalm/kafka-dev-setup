# k8s kafka env variables
export K8S_POD_KAFKACAT=$(kubectl get po | grep kafkacat | awk '{print $1}')
export K8S_POD_KAFKA_BROKER=$(kubectl get po | grep broker | awk '{print $1}')

echo $K8S_POD_KAFKACAT
echo $K8S_POD_KAFKA_BROKER

# aliases
alias k=kubectl

alias kafka-topics='kubectl exec -it $K8S_POD_KAFKA_BROKER -- kafka-topics'

alias kafka-console-producer='kubectl exec -it $K8S_POD_KAFKA_BROKER -- kafka-console-producer'

alias kafka-console-consumer='kubectl exec -it $K8S_POD_KAFKA_BROKER -- kafka-console-consumer'

alias kafka-consumer-groups='kubectl exec -it $K8S_POD_KAFKA_BROKER -- kafka-consumer-groups'

alias kcat='kubectl exec -it $K8S_POD_KAFKACAT -- kafkacat'

