# jenkins-autoinstall-terraform
run jenkins container on docker using ansible and prepare environment using bash script on EC2 instance with ubuntu OS using terraform as IAC

## commands:
cd name of pro 
export AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="YOUR_SECRET_ACCESS_KEY"
export AWS_REGION="YOUR_REGION"
ssh-keygen -t rsa -b 2048 -f admin
terraform init
terraform apply
sudo ssh -i "admin" ubuntu@(ip of control)
su - ansible (password is ansible)
ssh-copy-id node01
#ssh-copy-id node02
vim inventory
vim docker.yaml
ansible-playbook -i inventory docker.yaml
http://(public_ip of node01):8080
#http://(public_ip of node02):8080
sudo ssh ansible@(public_ip of node01)
docker logs jenkins 
#sudo ssh ansible@(public_ip of node02)
#docker logs jenkins 
 
