ssh node01 -- mkdir /drupal-data /drupal-mysql-data
kubectl create secret generic drupal-mysql-secret --from-literal=MYSQL_ROOT_PASSWORD=root_password --from-literal=MYSQL_DATABASE=drupal-database --from-literal=MYSQL_USER=root
cat *yaml > bravo.yaml
kubectl apply -f 01_drupal-pv.yaml
kubectl apply -f 01_drupal-pvc.yaml
sleep 1
kubectl apply -f 02_drupal-mysql-pv.yaml
kubectl apply -f 02_drupal-mysql-pvc.yaml
kubectl apply -f bravo.yaml
