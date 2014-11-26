ninjablocks:
	ansible-playbook \
	--inventory-file hosts \
	--extra-vars @../dotfiles/studio/ryokan/ninjablocks.yml \
	--vault-password-file ../dotfiles/studio/ryokan/vault.txt \
	playbooks/ninjablocks.yml

workstation:
	ansible-playbook \
	--inventory-file hosts \
	--extra-vars @../dotfiles/studio/ryokan/workstation.yml \
	--vault-password-file ../dotfiles/studio/ryokan/vault.txt \
	playbooks/workstation.yml
