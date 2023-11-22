## Jenkins-Autoinstall-Terraform
This project automates the installation of Jenkins on a Docker as a container with custom docker image [docker hub](https://hub.docker.com/layers/ahmedmosaad112/jenkins-with-docker/lts/images/sha256-7cc22cc5963a17e970a2bb2282e24316c728fd4a81798161678862397630f779?context=repo) using Ansible and use docker daemon of node01 . It also sets up the environment on an EC2 instance with Ubuntu OS using Terraform as an Infrastructure-as-Code (IAC) tool. The repository creates two instances: the control node and node01. It establishes an SSH connection between the two or more instances using bash scripts and installs Ansible on the control node and Docker on node01.

### Prerequisites :
1- Before running the installation, make sure you have Terraform installed. You can download it from the official website: 
```
Terraform Install
```

- Alternatively, for Ubuntu, you can run the following commands to install Terraform:
```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```
2- Create an AWS account: If you don't have an AWS account, go to the AWS website and create one.

3- Create an IAM user: In the AWS Management Console, go to the IAM service. Create a new IAM user Make sure to save the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY associated with this user.

4- Download the credentials: After creating the IAM user, you can download the CSV file containing the credentials. This file includes the access key ID and secret access key. Save this file locally in a secure location.

### Installation
- Follow these steps to install and configure Jenkins:

1- Clone this repository:
```
git clone https://github.com/your-username/jenkins-autoinstall-terraform.git
```
```
cd jenkins-autoinstall-terraform
```
2- Set the required environment variables to acess your AWS account :
```
export AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="YOUR_SECRET_ACCESS_KEY"
export AWS_REGION="YOUR_REGION"
```
3- Generate an SSH key pair by running the following command and pressing enter for defaults:
```
ssh-keygen -t rsa -b 2048 -f admin
```
4- Initialize Terraform and apply the configuration:
```
terraform init
```
```
terraform apply
```
 - Hint:The IPs of all nodes will appear as the output of Terraform. Connect to the control node using SSH:
```
sudo ssh -i "admin" ubuntu@(IP of control node)
```
5- Switch to the ansible user (password is "ansible", you may change it):
```
su - ansible
```
6- Copy the SSH key to node01:
```
ssh-copy-id node01
```
-----------------------------------------------------------------------------------------------------------------
If you have more than one node for other Ansible tasks (optional), copy the SSH key to additional nodes by running:
```
ssh-copy-id node(x)
```
-----------------------------------------------------------------------------------------------------------------
7- Open the inventory file and add the necessary content:
```
vim inventory
```
8- Open the docker-jenkins.yaml file and add the necessary content:
```
vim docker.yaml
```
9- Run the Ansible playbook to install Docker:
```
ansible-playbook -i inventory docker.yaml
```
10- In your browser, open the following URL to access Jenkins:
```
http://(public_ip of node01):8080
```
----------------------------------------------------------------------------------------------------------------------
If you have more than one node for other Ansible tasks (optional), you can access Jenkins on additional nodes using the following URL:
```
http://(public_ip of node(x)):8080
```
----------------------------------------------------------------------------------------------------------------------
11- If you need to continue the installation, connect to the node01 instance using SSH:
```
sudo ssh ansible@(public_ip of node01)
```
12- To view the Jenkins logs to add the key , run the following command:
```
docker logs jenkins
```
- Note: You can modify the Ansible task (which is Jenkins in this repository) and the number of nodes to suit your specific task.

- Feel free to make any necessary changes and contribute to this project!

- That's it! You have successfully installed and configured Jenkins using Ansible and Terraform.
