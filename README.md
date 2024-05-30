# Club Esportiu ITB Club - README

## Taula de continguts:
1. [Informació General](#general-info)
2. [Tecnologies](#technologies)
3. [Instal·lació](#installation)
4. [Autors](#collaboration)
## Descripció del Projecte <a name="general-info"></a>

Aquest projecte és una aplicació web per a la gestió d'un club esportiu. 
L'aplicació permet als usuaris consultar la informació general del club i tenen accés a funcionalitats adicionals com lloguers de pista i gestionar
equips, tornejos i classes. 
A més, permet al personal del club i als administradors gestionar reserves, tornejos, rànquings i molt més.

### Home
>![Foto de la home de l'aplicació](web/itb-club/src/assets/images/capt-home.png)
### Informació general:
>![Fotos d'informació](web/itb-club/src/assets/images/capt-about.png)

>![Fotos d'informació](web/itb-club/src/assets/images/capt-about2.png)
- Instal·lacions:
  
>![Fotos d'informació](web/itb-club/src/assets/images/capt-facilities.png)
- Clubs:
  
>![Fotos d'informació](web/itb-club/src/assets/images/capt-clubs.png)
- Tornejos del club:
  
>![Fotos d'informació](web/itb-club/src/assets/images/capt-tournamentsTypes.png)

## Funcionalitats d'Usuari:

### Usuari No Registrat
- Consultar informació general del club.
- Consultar tornejos i equips (sense informació detallada dels membres).

### Usuari Registrat
- Accedir a informació detallada del club, tornejos i equips.
- Veure el rànquing.
- Crear un equip o unir-se a un equip.
- Veure informació detallada del seu equip.
- Reservar una pista per fer una classe.
- Consultar comentaris

### Capità d'Equip
- Apuntar-se a tornejos.
- Fer reserves de classes.
- Veure informació detallada del seu equip.
- Reservar una pista per fer una classe.

### Administrador
- Accedir a tota la informació de la web.
- Crear i gestionar tornejos.
- Gestionar equips.
- Veure i modificar el rànquing.


## Funcionalitats Principals:

### Reserva de pistes
- Lloger de pistes per entrenaments, partits, tornejos...
>![Fotos d'informació](web/itb-club/src/assets/images/capt-bookings.png)

### Comentaris
- L'entrenador pot afegir comentaris sobre una classe.
- L'usuari pot consultar els seus comentaris.

### Jugadors
- Logar-se.
- Alta, baixa i modificació de la informació dels jugadors.
- Llistat de jugadors segons puntuació.
- Rànquing calculat segons resultats en tornejos.

>![Fotos d'informació](web/itb-club/src/assets/images/capt-login.png

>![Fotos d'informació](web/itb-club/src/assets/images/capt-updateProfile.png)

>![Fotos d'informació](web/itb-club/src/assets/images/capt-profileUpdated.png)

>![Fotos d'informació](web/itb-club/src/assets/images/capt-tournamentsInfo.png)

- Apuntar-se a equips:

>![Fotos d'informació](web/itb-club/src/assets/images/capt-teams.jpg)

>![Fotos d'informació](web/itb-club/src/assets/images/capt-teams.png)


### Tornejos
- Alta de tornejos.
- Assignar jugadors/equips al torneig.
- Classificació dels equips dins del torneig.

>![Fotos d'informació](web/itb-club/src/assets/images/capt-tournamentsInfo.png)

### Consultar el Rànquing
- Estadístiques de cada equip (punts a favor, punts en contra, victòries/derrotes).
- Puntuació reflectida al rànquing general.

>![Fotos d'informació](web/itb-club/src/assets/images/capt-rankings.png)

### Classes Particulars
- Fitxa del jugador amb comentaris.
- Reservar classe particular.
- Reservar pista per les classes.
  
>![Fotos d'informació](web/itb-club/src/assets/images/capt-training.jpg)


## Estructura de la Base de Dades

La base de dades està estructurada per donar suport a les funcionalitats mencionades. Inclou les següents taules principals:

1. **Persones**: Informació de tots els usuaris registrats.
2. **Equips**: Informació dels equips i els seus membres.
3. **Tornejos**: Informació dels tornejos.
4. **Partits**: Informació dels partits, participants, tipus i estadístiques.
5. **Pistes**: Tipus de pistes del club.
6. **Comentaris**: Comentaris de l'entrenador en les classes particulars.
7. **Reserves**: Reserva de pistes i classes particulars.
8. **Pagaments**: Pagaments de les reserves.
9. **Seus**: Localització de les seus de l'ITB club.


## Instal·lació i Configuració <a name="installation"></a>

1. Cloneu el repositori:
   git clone <https://github.com/SerraSilvia/gestio_basquet.git>

2. Instal·lar vite en extensió Visual Studio Code.

3. Instal·lar nodejs: https://nodejs.org/en

4. Instal·lar xampp: https://www.apachefriends.org/es/download.html

5. Dins de la carpeta xampp en htdocs enganxarem el repositori clonat

En la terminal:
npm install vite --save -dev
npm run dev
obrir:  http://localhost:5173/

# Technologies <a name="technologies"></a>
***
A list of technologies used within the project:
* [JavaScript](https://developer.mozilla.org/es/docs/Web/JavaScript)
* [Vue 3](https://es.vuejs.org/v2/guide/)
* [PHP](https://www.php.net/manual/es/index.php)
* [Axios](https://axios-http.com/es/docs/intro)
* [GitHub](https://docs.github.com/es)
* [Docker](https://docs.docker.com/)
* [AWS](https://docs.aws.amazon.com/es_es/)

## Col·laboradors: <a name="collaboration"></a>
***
> Anna Cano 
> Oscar Serrano
> Silvia Serra
