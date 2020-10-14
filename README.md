#KIT-IT_infra
#KIT-IT Infra repository..
#Домашнее задание 4

bastion_IP = 84.201.172.200
someinternalhost_IP = 10.130.0.23

Скозвное подключение через одну команду ssh -i ~/.ssh/appuser -AJ appuser@84.201.172.200 appuser@10.130.0.23
для быстрого подключения используется ProxyJump
Создаем ~/.ssh/config
Вносми кофиграцию:

Host bastion
	HostName 84.201.172.200
	Port 22
        IdentityFile ~/.ssh/appuser
        User appuser
	ForwardAgent yes

Host someinternalhost
        ProxyJump bastion
        HostName 10.130.0.23
	Port 22
        IdentityFile ~/.ssh/apuser
        User appuser

Далее используем команду ssh someinternalhost  для быстрого и удобного подключения

#Домашнее задание 5

testapp_IP = 84.201.175.33
testapp_port = 9292
