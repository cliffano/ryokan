clean:
	rm -f ryokan.log
	rm -f tmux*.log
	rm -rf roles

init:
	mkdir -p roles

deps: init
	pip3 install -r requirements.txt
	ansible-galaxy install -r requirements.yml --force

beaglebone00:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/beaglebone00.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/beaglebone00.yml

cloud00:
	ansible-playbook \
	--verbose \
	--connection local \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/cloud00.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/cloud00.yml

macbookair00:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/macbookair00.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/macbookair00.yml

macmini00:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/macmini00.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/macmini00.yml

macbookpro00:
	ansible-playbook \
	--verbose \
	--connection=local \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/macbookpro00.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	--ask-become-pass \
	playbooks/macbookpro00.yml

macbookpro01:
	ansible-playbook \
	--verbose \
	--connection=local \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/macbookpro01.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	--ask-become-pass \
	playbooks/macbookpro01.yml

raspberrypi00:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/raspberrypi00.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/raspberrypi00.yml
