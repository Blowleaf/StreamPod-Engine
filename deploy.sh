# create the cluster
eksctl create cluster -f streampod-engine-cluster.yml

# add the nginx containers
kubectl apply -f ./streampod-engine-deployment.yml
# Expose the main containers
kubectl expose deployment/streampod-engine \
        --port=8080 --target-port=8080 \
        --name=streampod-engine-service --type=LoadBalancer

# Get services
kubectl get svc streampod-engine-service
