workstation:
	ansible-playbook \
	--inventory-file hosts \
	--extra-vars @../dotfiles/studio/ryokan/workstation.yml \
	playbooks/workstation.yml
