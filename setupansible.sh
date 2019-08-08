################################
### ANSIBLE SETUP ##############
################################

echo "Setting up system with Ansible as [root]"
ansible-playbook -v -i "localhost," -c local ansible_playbooks/ansible_root.yml

echo "Setting up system with Ansible as [user]"
ansible-playbook -vvv -i "localhost," -c local ansible_playbooks/ansible_user.yml

echo "Ansible - DONE"

