# Public directory

The php:7.4-apache image set the Apache public directory to /var/www.

# Build Image Docker

Use next command:

```
docker build -t "gestio_basquet_api" .
```

# Run Docker Image 

Execute run_docker.bat into root folder project

# Url API 

http://localhost:3001/routes/folders../index.php

# Creació de Docker:

## Requisits previs:
- Hem de tenir instal·lat: Docker Desktop per a Windows o Linux.
- Tenir clonat el repositori git: $ git clone YOUR_REPOSITORY_URL

## Seguim la guia:
https://semaphoreci.com/community/tutorials/dockerizing-a-php-application


1- Dins la carpeta api, creem un arxiu Dockerfile i escribim: FROM php:7.4-apache
2- Escollim la imatge que volem, es pot triar a la imatge a la web de Docker: https://hub.docker.com/
    Tenir en compte que; Una imatge és fixa, el contenidor és el que executa la imatge.
    Aquesta imatge triada té un bash (és un intérpret d'ordres tipus la shell,és a dir, una terminal)

    - En linux per instal·lar: $ apt-get update && apt-get install docker

3- Arranquem el Docker, igual que quan feiem servir xampp.
    - En la terminal vs: 
    cd api  (cd per navegar entre directoris, canviarem a la carpeta api per executar el docker compose  )
    docker --versio   (saber la versió que tenim)
    docker ps   (llista els contenidors)
    docker image ls   (llista les imatges)
    docker build -t "gestio_basquet_api" .   (build per construir, -t per especificar el nom de la imatge, entre cometes "" va el   nom i el . serveix per especificar la ruta, si estigués fora de la carpeta hauriem de posar ./)

Un cop executat el docker: docker build -t "gestio_basquet_api" .  En la terminal apareixerà:
=> [1/1] perquè només hem escrit una sentència que es: FROM php:7.4-apache

En vs clicant a l'extensió Docker,  a dalt a la dreta on tenim Explorer, Search, git... sortiràn els apartats:
CONTAINERS
    - individual containers
    - gestio_basquet_api
IMAGES
    - gestio_basquet_api

4- En la terminal vs: docker ps  (ens interessa quedar-nos amb la id del contenidor)
    Apareixerà un text on surt:
    CONTAINER ID                     IMAGE         COMMAND           ...
    (codi amb id contenidor )       (més codi)     (més codi)

Escriurem a la terminal:  docker exec -it  idContenidor (codi extret d'abans)  (-it serveix per relacionar)
Un cop llençat, es canvien les rutes: root@nomDelContenidor

5- Aquesta imatge es posa en l'Apache, public directory to var/www/html.
Dins l'Apache.conf, escriurem el codi de la guia:             
                                                # 000-default.conf

                                                <VirtualHost *:80>
                                                ServerAdmin webmaster@localhost
                                                DocumentRoot /var/www/public

                                                <Directory /var/www>
                                                    Options Indexes FollowSymLinks
                                                    AllowOverride All
                                                    Require all granted
                                                </Directory>
                                                </VirtualHost>
I afegirem dins el Dockerfile: COPY 000-default.conf /etc/apache2/sites-available/000-default.conf  a sota de FROM php:7.4-apache

Per ficar les source files dins del contenidor, farem servir COPY command: a sota del que tenim al Dockerfile com ens diu la guía:
COPY src /var/www/
RUN chown -R www-data:www-data /var/www

I cridarem l'script a sota del que he escrit:
CMD ["start-apache"]en la guía

6- Tornem a executar el dockerbuild per afegir les noves sentències afegides al Dockerfile:
docker build .  ($ al davant si és terminal de linux)
En el llistat que surt hem de tenir :  
CACHED [1/5] Ja que haviem carregat una sentència prèvia i està guardada a la caché.

Si tinguéssim algun error, és possible que estigui en l'apache.conf. (Se li pot demanar al chat que digui on és)
Allà mateix haurem d'enllaçar el port 80 (és el que fa servir Apache) amb el port 3001 (el que fa servir la nostra màquina)
Sempre que fem canvis a la nostra màquina s'ha de fer un altre dockerbuild.

!A tenir en compte: Els contenidors SEMPRE són de lectura, si volem escriure i manipular, s'anomena fer un VOLUM. Quan ho activem, simplement fent f5 se'ns guardaria. Estaria en un arxiu anomenat run_docker.bat però al afegir més contenidors per interaccionar, el codi s'especifica a docker-compose.yml.

- docker build és per un contenidor
- docker compose és per més d'un contenidor 

7- Docker compose utilitza fitxers YAML per configurar i executar contenidors. Això vol dir que podem enviar la nostra aplicació Dockerfile per crear l'entorn i utilitzar a docker-compose.ymlper executar els contenidors.
El codi al fitxer docker-compose.yml està a la guia.

Haurem d'afegir també el següent codi al dockerfile per fer un Setup Apache2 config:
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
i canviar el CMD a:      CMD ["apache2-foreground"]    

7- Tornant a l'extensió Docker, en l'apartat NETWORKS crees: basquet_network per que es puguin parlar entre els contenidors.
8- Als teus contenidors pots definir variables d'entorn. A nosaltres no ens fan falta perque fem servir PHP però per tenir tota la info de la base de dades està bé.  MYSQL_HOST = db  (el host ara es la bbdd)
