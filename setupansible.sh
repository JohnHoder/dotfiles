################################
### ANSIBLE SETUP ##############
################################

echo "Setting up system with Ansible ..."

ansible-playbook -v -i "localhost," -c local ansible.yml

echo "Ansible - DONE"

