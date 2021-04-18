clean:
	rm -f ryokan.log
	rm -f tmux*.log
	rm -rf roles

init:
	mkdir -p roles

deps: init
	pip3 install -r requirements.txt
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

macmini00:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/macmini00.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/media.yml

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

macbookair00:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/macbookair00.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/util.yml
