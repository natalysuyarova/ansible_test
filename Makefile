# Makefile
INVENTORY=inventory.ini
PLAYBOOK=install_play.yml

# Ad-hoc команда: пинг всех серверов из inventory
ping:
	ansible all -i $(INVENTORY) -m ping
# Дополнительные полезные цели
uptime:
	ansible all -i $(INVENTORY) -m shell -a "uptime"

facts:
	ansible all -i $(INVENTORY) -m setup

.PHONY: ping uptime facts

help:
	@echo "Доступные цели:"
	@echo "  make packages  - только пакеты (tag=packages)"
	@echo "  make users     - только пользователи (tag=users)"
	@echo "  make full      - весь плейбук целиком"
	@echo "  make check     - проверка синтаксиса"
	@echo "  make uninstall -удаление пакетов"

packages:
	ansible-playbook -i $(INVENTORY) $(PLAYBOOK) --tags packages

users:
	ansible-playbook -i $(INVENTORY) $(PLAYBOOK) --tags users

full:
	ansible-playbook -i $(INVENTORY) $(PLAYBOOK)

check:
	ansible-playbook -i $(INVENTORY) $(PLAYBOOK) --syntax-check
uninstall:
	ansible-playbook -i $(INVENTORY) $(PLAYBOOK) --tag uninstall
nginx:
	ansible-playbook -i $(INVENTORY) nginx_vars.yml
