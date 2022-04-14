mkdir playbook
cd
cd playbook/
touch mern.yml
cd
apt update
apt install software-properties-common
add-apt-repository --yes --update ppa:ansible/ansible
apt install ansible
