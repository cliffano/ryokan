clean:
	rm -f ryokan.log
	rm -rf roles

init:
	mkdir -p roles
	ansible-galaxy install -r requirements.yml --force

home:
	ansible-playbook \
	--inventory-file hosts \
	--extra-vars @../dotfiles/studio/ryokan/home.yml \
	--vault-password-file ../dotfiles/studio/ryokan/vault.txt \
	playbooks/home.yml

iot:
	ansible-playbook \
	--inventory-file hosts \
	--extra-vars @../dotfiles/studio/ryokan/iot.yml \
	--vault-password-file ../dotfiles/studio/ryokan/vault.txt \
	playbooks/iot.yml

web:
	ansible-playbook \
	--inventory-file hosts \
	--extra-vars @../dotfiles/studio/ryokan/web.yml \
	--vault-password-file ../dotfiles/studio/ryokan/vault.txt \
	playbooks/web.yml

workstation:
	ansible-playbook \
	--connection=local \
	--inventory-file hosts \
	--extra-vars @../dotfiles/studio/ryokan/workstation.yml \
	--vault-password-file ../dotfiles/studio/ryokan/vault.txt \
	playbooks/workstation.yml
