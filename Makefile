# NOTE: All targets here are host targets since host machine is where
# the control steps are to be done, yes, including the deps.

clean:
	rm -f ryokan.log
	rm -rf roles collections

init:
	mkdir -p roles collections

define python_venv
	. .venv/bin/activate && $(1)
endef

deps: init
	python3 -m venv .venv
	$(call python_venv,python3 -m pip install -r requirements.txt)
	$(call python_venv,ansible-galaxy install -r requirements.yml --force)

deps-upgrade:
	$(call python_venv,python3 -m pip install -r requirements-dev.txt)
	$(call python_venv,pip-compile --upgrade)

define ansible_playbook_local
	$(call python_venv,ansible-playbook \
		--verbose \
		--connection=local \
		--inventory-file hosts \
		--extra-vars @../config/studio/ryokan/$(1).yml \
		--vault-password-file ../config/studio/ryokan/vault.txt \
		--ask-become-pass \
		playbooks/$(1).yml)
endef

define ansible_playbook_remote
	$(call python_venv,ansible-playbook \
		--verbose \
		--inventory-file hosts \
		--extra-vars @../config/studio/ryokan/$(1).yml \
		--vault-password-file ../config/studio/ryokan/vault.txt \
		--ask-become-pass \
		playbooks/$(1).yml)
endef

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

delllatitude00:
	ansible-playbook \
	--verbose \
	--connection local \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/delllatitude00.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	--ask-become-pass \
	playbooks/delllatitude00.yml

macbookair00:
	$(call ansible_playbook_local,macbookair00)


macbookair01:
	$(call ansible_playbook_local,macbookair01)

macmini00:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/macmini00.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	--ask-become-pass \
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

macbookpro02:
	ansible-playbook \
	--verbose \
	--connection=local \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/macbookpro02.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	--ask-become-pass \
	playbooks/macbookpro02.yml

raspberrypi00:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/raspberrypi00.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	--ask-become-pass \
	playbooks/raspberrypi00.yml

raspberrypi01:
	$(call ansible_playbook_remote,raspberrypi01)
