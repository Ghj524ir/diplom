# Дипломная работа по профессии «Системный администратор» - Ломовский Александр Владимирович
 
### Задача
Ключевая задача — разработать отказоустойчивую инфраструктуру для сайта, включающую мониторинг, сбор логов и резервное копирование основных данных. Инфраструктура должна размещаться в Yandex Cloud и отвечать минимальным стандартам безопасности: запрещается выкладывать токен от облака в git.

[Полный текст задания для дипломной работы](https://github.com/netology-code/sys-diplom/tree/diplom-zabbix?tab=readme-ov-file "Полный текст задания для дипломной работы")

# Выполнение работы
## Инфраструктура

Первым делом, настроим окружение, установим VScode с помощью которого будем писать конфигурационные файлы. Установим программы которые нам понадобятся в ходе выполнения работы, такие как terraform и ansible. Настроим ya CLI и выпустим для себя SSH ключ. 

Далее приступим к созданию инфраструктуры с помощью Terraform. Создадим файлы в которых опишем апеременные, группы безопастности, создаваемы машины, сети, подсети, балансировщик.

Проверим что конфигурация не содержит ошибок командой

```
terraform validate
```
![terraform validate](/img/terraform_valid.png)

Выполняем 

```
terraform apply
```
и смоттрим как поднялась инфраструктура.
![terraform_apply](/img/terraform_apply.png)

Dashboard

![dashboard](/img/dashboard.png)

Виртуальные машины

![vm](/img/vm.png)

Сети

![net](/img/net.png)

Подсети

![subnet](/img/subnet.png)

Группы безопастности

![security_group](/img/security_group.png)

Балансировщик

![balance](/img/balance.png)

Target group

![target_group](/img/target_group.png)

HTTP router

![http_router.png](/img/http_router.png)

Инфраструктура готова, можем приступить к работе с ansible/

## Сайт мониторинг и логи

Для того, чтобы настроить созданные на предыдущем этапе машины, будем использовать роли для ansible.
Создадим отдельные роли для разворачивания nginx, zabbix, elasticsearsh? filebeat и kibana

Чтобы проверить, что машины доступны для настройки выполним 
```
ansible all -m ping
```

![ping](/img/ping.png)

машины доступны, а значит, мы можем приступить к выполнению плейбуков.

```
ansible-playbook expand.yml
```

![install](/img/install.png)

Проверяем что сайт доступен, открываем его в браузере

![site](/img/site.png)

Проверяем что все работает. Открываем zabbix и настраиваем dashboard

![zabbix](/img/zabbix.png)

![zabbix](/img/zabbix2.png)

![zabbix](/img/zabbix3.png)

![zabbix](/img/zabbix4.png)

![zabbix](/img/zabbix5.png)

![zabbix](/img/zabbix6.png)

![zabbix](/img/zabbix7.png)

![zabbix](/img/zabbix8.png)

Переходим к elastic

![elastic](/img/elk.png)

![elastic](/img/elk2.png)

![elastic](/img/elk3.png)

![elastic](/img/elk4.png)

![elastic](/img/elk5.png)

## Резервное копирование

Настраивается на этапе terraform.

![snapshot](/img/snapshot.png)

## Итог

Все необходимые сервисы работают.
Доступ к ресурсам можно получить по ссылкам

Сайт https://84.252.132.202/

Zabbix http://89.169.139.187/zabbix/
Логин Admin пароль zabbix

Elasticsearsh http://89.169.131.181:5601/app/discover