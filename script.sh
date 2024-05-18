#!/bin/bash

function prepare_bastion() {
sudo apt update
sudo apt install ansible -y
if [ ! -f /usr/share/keyrings/hashicorp-archive-keyring.gpg ]; then
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
fi

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
}

function create_instances() {
    cd terraform
    terraform init
    terraform apply --auto-approve
}

function paste_ip() {
    IP=$(terraform output -raw ec2)
    sed -i "s/ansible_host=[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/ansible_host=$IP/" ../ansible/hosts
}

function run_ansible() {
    cd ../ansible
    ansible-playbook main.yml
}


prepare_bastion
create_instances
paste_ip
sleep 30
run_ansible