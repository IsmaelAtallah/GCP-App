# **My First Deplyment**
## Tools I used
  * Docker 
  * Terraform
  * Kubernates
  * GCP
---
## Demo 
  you can clone the project
```
    $ git clone https://github.com/IsmaelAtallah/GCP.git
```
  after that you have to build docker image 
```
    $ docker build /code/. -t  gcr.io/ismael-atallah/devops 
```
  to build infrastructure go to your terraform dire and run
```
    $ terraform init
    $ terraform applay -auto-approve
```
  connect to private-vm on gcp then copy /k8s into it after that run 
```
    $ kubectl apply -f redis.yaml 
    $ kubectl apply -f conf.yaml
    $ kubectl apply -f python.yaml 
```

