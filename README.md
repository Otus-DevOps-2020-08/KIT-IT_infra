#KIT-IT_infra
#KIT-IT Infra repository...
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

[+] Основное ДЗ
[+] Задание со *
В процессе сделано:
Установили и настроили yc CLI
Создали хост с помощью CLI
Установили\запустили ruby и mongodb
Задеплоили тестовое приложение
Как запустить проект:
Создать хост с помощью CLI
Выполнить команду yc compute instance create
--name reddit-app2
--hostname reddit-app2
--memory=4
--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4
--metadata serial-port-enable=1
--metadata-from-file user-data=./metadata.yaml
Как проверить работоспособность:
перейти по ссылке http://84.201.175.33:9292/
PR checklist
[+] Выставил label с номером домашнего задания
[+] Выставил label с темой домашнего задания

#Домашнее задание 6

1. Параметризирование шаблона и запуск parker:
   packer build -var-file=variables.json ./ubuntu16.json
1.1. ВЫмышленные переменные содержатся в файле variables.json
2. Построение bake-образа: packer build -var-file=variables.json ./immutable.json
3. Инициализация ВМ config-scripts/create-reddit-vm.sh
   yc compute instance create
name reddit-full-instance
hostname reddit-full-instance
memory=2
create-boot-disk image-family=reddit-full,size=10GB
network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4
metadata serial-port-enable=1
ssh-key ~/.ssh/kit/appuser.pub

#Домашнее задание 7

1. Создан Insnace reddit-app.
2. Определены переменные по заданию.
3. Отформатированы конфигурационные файлы.
4. Выложен в git terraform.tfvars.example.
5. Создан балансировщик и lb.tf. Задание с count не выполнено.
