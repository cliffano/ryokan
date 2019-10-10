clean:
	rm -f ryokan.log
	rm -f tmux*.log
	rm -rf roles

init:
	mkdir -p roles

deps: init
	pip install -r requirements.txt
	ansible-galaxy install -r requirements.yml --force

ci:
	ansible-playbook \
	--verbose \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/ci.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/ci.yml

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

studio:
	ansible-playbook \
	--verbose \
	--connection=local \
	--inventory-file hosts \
	--extra-vars @../config/studio/ryokan/studio.yml \
	--vault-password-file ../config/studio/ryokan/vault.txt \
	playbooks/studio.yml

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
