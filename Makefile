clean:
	rm -f ryokan.log
	rm -rf roles

init:
	mkdir -p roles
	ansible-galaxy install -r requirements.yml --force

home:
	ansible-playbook -vvv \
	--inventory-file hosts \
	--extra-vars @../dotfiles/studio/ryokan/home.yml \
	--vault-password-file ../dotfiles/studio/ryokan/vault.txt \
	playbooks/home.yml

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
