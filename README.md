# jenkins-autoinstall-terraform
- run jenkins container on docker using ansible and prepare environment using bash script on EC2 instance with ubuntu OS using terraform as IAC tool
- this repo create two instances the first one is control node and the second one is node01
- stablish ssh connection between the two instances using bash scripts
- install ansible on control node and docker on node01 using bash scripts
## commands:
- after cloning this repo run :
```
cd jenkins-autoinstall-terraform
```
```
export AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="YOUR_SECRET_ACCESS_KEY"
export AWS_REGION="YOUR_REGION"
```
- Press enter for defaults
```
ssh-keygen -t rsa -b 2048 -f admin
```
- then
```
terraform init
```
```
terraform apply
```
- ips of all nodes will apper as output of terraform 
```
sudo ssh -i "admin" ubuntu@(ip of control node)
```
```
su - ansible (password is ansible)
```
```
ssh-copy-id node01
```
###### if you add more than one node for other ansible tasks run :
```
ssh-copy-id node02
```
- add the content of inventory file here 
```
vim inventory
```
- add the content of docker.yaml file here 
```
vim docker.yaml
```
```
ansible-playbook -i inventory docker.yaml
```
-in your browser add :
```
http://(public_ip of node01):8080
```
###### if you have more than one node for other ansible tasks also run : 
```
http://(public_ip of node02):8080
```
-if you need to continue installation run :
```
sudo ssh ansible@(public_ip of node01)
```
```
docker logs jenkins
```
###### if you have more than one node for other ansible tasks also run : 
```
sudo ssh ansible@(public_ip of node02)
```
-and
```
docker logs jenkins
``` 
- ##### you can change ansible task which is jenkins in this repo and number of nodes to be suitable with your spacific task 
