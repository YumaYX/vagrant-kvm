default: clean
	vagrant up --provision

clean:
	vagrant destroy -f

install:
	sudo dnf -y install ansible-core

ans:
	ansible -i hosts all -m ping
	ansible-playbook -i hosts site.yml
