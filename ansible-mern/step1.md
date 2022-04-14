a() { docker exec -it ansible bash -c "echo 'PS1='\''ansible# '\' >> /root/.bashrc; bash"; }

t() {  docker exec -it target bash -c "echo 'PS1='\''target# '\' >> /root/.bashrc; bash";  }

a

ssh-keygen -t rsa

exit

t

[ ! -d ~/.ssh ] && mkdir ~/.ssh; cat /shared_volume/ansible_id_rsa.pub >> ~/.ssh/authorized_keys

cat ~/.ssh/authorized_keys

exit

docker network inspect mynetwork

a 

open /etc/ansible/ansible.cfg, uncomment inventory = .... and sudo_user = ..., and save

This is what it should look like after editing:

open /etc/ansible/hosts, append new group called [nodes] and the ip address of the node.