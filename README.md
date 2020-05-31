![alt text](Docker-Web-Client_Github.png)

Оперативно поднять **Pilot- Web- Client** , подключенный к **Pilot- Server** , можно с помощью [готового контейнера](https://cloud.docker.com/u/pilotdev/repository/docker/pilotdev/web-client) Docker. Решение является кроссплатформенным, поэтому Pilot-Server и Web-Client могут быть установлены как на Windows так и на Linux в любой комбинации.  
Для начала необходим установленный **Docker** и рабочий **Pilot-Server**, подключенный к базе данных.
# Установка Docker
Для установки на Windows [загрузите](https://download.docker.com/win/stable/Docker%20Desktop%20Installer.exe) c официального сайта **docker.com** дистрибутив и запустите его.  
Для установки на Linux перейдите по [ссылке](https://hub.docker.com/search?q=&type=edition&offering=community) и выберите дистрибутив, затем установите **Docker** согласно специфичным для дистрибутива инструкциям. Например, руководство по установке для **Ubuntu Linux** находится [здесь](https://docs.docker.com/engine/install/ubuntu/).
# Установка Pilot-Server
Чтобы установить **Pilot-Server** воспользуйтесь руководством для [Windows](http://help.pilotems.com/ru/Content/readme.htm) или для [Linux](http://help.pilotems.com/ru/Content/Install_Pilot-Server_for_Linux.htm).  
Если **Pilot-Server** установлен и работает, проверьте соединение в браузере по адресу:
`http://Pilot-Server_IP:5545/`  
Браузер покажет версию вашего Pilot-Server, если соединение установлено успешно.  
Например:  
`Pilot-Server_v1.0.48652.29461.`  
Убедитесь, что Pilot-Server подключен к базе данных.
# Запуск контейнера docker-web-client
Скачайте контейнер **docker-web-client** с docker hub командой  
### `# docker pull pilotdev/web-client`  
Запустите контейнер командой:  
### `# docker run --rm -it --env server=[http://Pilot-Server_IP:5545/] --env database=[имя_базы_данных] --name web-client -p 80:80 pilotdev/web-client:latest`
При запуске контейнера необходимо указывать именно IP сервера Pilot. Если указать адрес server=http://localhost:5545/, то **docker-web-client** обратится к внутреннему localhost контейнера, и не сможет соединиться с Pilot-Server.  
Например, если IP сервера `http://10.0.0.100:5545`, а имя подключенной базы данных `pilot-ice_ru`, то команда для запуска docker-web-client будет выглядеть так:  
### `#docker run --rm -it --env server=http://10.0.0.100:5545 --env database=pilot-ice_ru --name web-client -p 80:80 pilotdev/web-client:latest`  
Проверьте соединение в браузере по адресу: `http://docker-web-client_IP:80/`  
Где *docker-web-client_IP* – IP сервера, на котором установлен docker-web-client.  
Если Web Client работает, то откроется страница входа в Pilot-Web-Client.  
Введите имя пользователя и пароль пользователя базы данных, к которой подключен Pilot- Server. Если всё вышеперечисленное было сделано правильно, то откроется страница **Файлы**.  

## Поздравляем, Вы успешно подняли **Pilot-Web-Сlient** с помощью контейнера Docker.
