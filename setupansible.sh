################################
### ANSIBLE SETUP ##############
################################

echo "Setting up system with Ansible as [root]"
ansible-playbook -v -i "localhost," -c local ansible_playbooks/ansible_root.yml

#echo "Setting up TeX packages and texmaker"
#ansible-playbook -v -i "localhost," -c local ansible_playbooks/ansible_root_texmaker.yml

echo "Setting up system with Ansible as [user]"
ansible-playbook -v -i "localhost," -c local ansible_playbooks/ansible_user.yml

echo "Ansible - DONE"

### MORE VERBOSE ###
# Use -vvv


