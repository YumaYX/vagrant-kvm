default: clean
	vagrant up --provision

clean:
	vagrant destroy -f

install:
	sudo dnf -y install ansible-core

ans:
	ansible -i hosts all -m ping
	ansible-playbook -i hosts site.yml

pub:
	git status
	sleep 5
	git add .
	git commit -am 'update'
	git push
