# Makefile
INVENTORY=inventory.ini

# Ad-hoc команда: пинг всех серверов из inventory
ping:
	ansible all -i $(INVENTORY) -m ping
# Дополнительные полезные цели
uptime:
	ansible all -i $(INVENTORY) -m shell -a "uptime"

facts:
	ansible all -i $(INVENTORY) -m setup

.PHONY: ping uptime facts
