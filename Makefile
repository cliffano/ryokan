clean:
	rm -f ryokan.log
	rm -f tmux*.log
	rm -rf roles

init:
	mkdir -p roles

deps: init
	pip install -r requirements.txt
	ansible-galaxy install -r requirements.yml --force

raspberrypi00:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/raspberrypi00.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/raspberrypi00.yml

cloud-a:
	ansible-playbook \
	--verbose \
	--connection local \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/cloud-a.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/cloud-a.yml

media:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/media.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/media.yml

office-blue:
	ansible-playbook \
	--verbose \
	--connection=local \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/office-blue.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/office-blue.yml

iot:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/iot.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/iot.yml

macbookpro00:
	ansible-playbook \
	--verbose \
	--connection=local \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/macbookpro00.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	--ask-become-pass \
	playbooks/macbookpro00.yml

util:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/util.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/util.yml

web:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/web.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/web.yml

x-workstation:
	ansible-playbook \
	--verbose \
	--connection=local \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/workstation.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
  --ask-sudo-pass \
	playbooks/workstation.yml
