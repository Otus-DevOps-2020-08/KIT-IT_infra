# KIT-IT_infra
KIT-IT Infra repository
Домашнее задание 4

bastion_IP = 130.193.49.215
someinternalhost_IP = 10.130.0.33

Скозвное подключение через одну команду [user@localhost .ssh]$ ssh -i ~/.ssh/kit-it -Jkit-it@130.193.49.215 kit-it@10.130.0.33
для быстрого подключения используется ProxyJump
Создаем ~/.ssh/config
Вносми кофиграцию:

Host bastion
	HostName 130.193.49.215
        IdentityFile ~/.ssh/kit-it
        User kit-it

Host someinternalhost
        ProxyJump bastion
        HostName 10.130.0.33
        User kit-it

Далее используем команду ssh someinternalhost  для быстрого и удобного подключения

sudo pritunl setup-key - d9c516f3922a476e850cbcb490632ab6
