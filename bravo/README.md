# users

Users connect to frontend service: drupal-service

# drupal
/drupal-datadrupal:8.6
Configure drupal-pv with hostPath = /drupal-data (create the directory on Worker Nodes)

Access modes: ReadWriteOnce
Volume Name: drupal-pv
Storage: 5Gi

Claim Name: drupal-pvc
Storage Request: 5Gi
Access modes: ReadWriteOnce

Deployment Name: drupal
Replicas: 1
Image: drupal:8.6
Deployment has an initContainer, name: 'init-sites-volume'
initContainer 'init-sites-volume', image: drupal:8.6
initContainer 'init-sites-volume', persistentVolumeClaim: drupal-pvc
initContainer 'init-sites-volume', mountPath: /data
initContainer 'init-sites-volume', Command: [ "/bin/bash", "-c" ], initContainer: Args: [ 'cp -r /var/www/html/sites/ /data/; chown www-data:www-data /data/ -R' ]
Deployment 'drupal' uses correct pvc: drupal-pvc
Deployment has a regular container, name: 'drupal', image: 'drupal:8.6'
container: 'drupal', Volume mountPath: /var/www/html/modules, subPath: modules
container: 'drupal', Volume mountPath: /var/www/html/profiles, subPath: profiles
container: 'drupal', Volume mountPath: /var/www/html/sites, subPath: sites
container: 'drupal', Volume mountPath: /var/www/html/themes, subPath: themes
Deployment: "drupal" running
Deployment: 'drupal' has label 'app=drupal'

frontend service name: drupal-service
drupal-service configured as NodePort
drupal-service uses NodePort 30095


# drupal-mysql

Configure drupal-mysql-pv with hostPath = /drupal-mysql-data (create the directory on Worker Nodes)

Volume Name: drupal-mysql-pv
Storage: 5Gi
Access modes: ReadWriteOnce

Claim Name: drupal-mysql-pvc
Storage Request: 5Gi
Access modes: ReadWriteOnce

Name: drupal-mysql
Replicas: 1
Image: mysql:5.7
Deployment Volume uses PVC : drupal-mysql-pvc
Volume Mount Path: /var/lib/mysql, subPath: dbdata
Deployment: 'drupal-mysql' running

Secret Name: drupal-mysql-secret
Secret: MYSQL_ROOT_PASSWORD=root_password
Secret: MYSQL_DATABASE=drupal-database
Secret: MYSQL_USER=root

Name: drupal-mysql-service
Type: ClusterIP
Port: 3306

