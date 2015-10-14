clean:
	rm -f ryokan.log
	rm -rf roles

init:
	mkdir -p roles
	ansible-galaxy install -r requirements.yml --force

ci:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../dotfiles/studio/ryokan/ci.yml \
	--vault-password-file ../dotfiles/studio/ryokan/vault.txt \
	playbooks/ci.yml

home:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../dotfiles/studio/ryokan/home.yml \
	--vault-password-file ../dotfiles/studio/ryokan/vault.txt \
	playbooks/home.yml

iot:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../dotfiles/studio/ryokan/iot.yml \
	--vault-password-file ../dotfiles/studio/ryokan/vault.txt \
	playbooks/iot.yml

web:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../dotfiles/studio/ryokan/web.yml \
	--vault-password-file ../dotfiles/studio/ryokan/vault.txt \
	playbooks/web.yml

workstation:
	ansible-playbook \
	--verbose \
	--connection=local \
	--inventory-file hosts \
	--extra-vars @../dotfiles/studio/ryokan/workstation.yml \
	--vault-password-file ../dotfiles/studio/ryokan/vault.txt \
  --ask-sudo-pass \
	playbooks/workstation.yml
