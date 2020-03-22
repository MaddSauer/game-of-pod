# add tripple-dash to files
# sed -i '1 i\---' *.yaml
kubectl create ns vote
kubectl config set-context --current --namespace=vote
kubectl apply -f .
