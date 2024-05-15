# Club Esportiu - README

## Descripció del Projecte

Aquest projecte és una aplicació web per a la gestió d'un club esportiu. L'aplicació permet als usuaris no registrats consultar informació general del club, mentre que els usuaris registrats tenen accés a funcionalitats addicionals com la gestió d'equips, tornejos i classes. A més, permet al personal del club i als administradors gestionar reserves, tornejos, rànquings i molt més.

## Funcionalitats Principals

### Usuari No Registrat
- Consultar informació general del club.
- Consultar tornejos i equips (sense informació detallada dels membres).

### Usuari Registrat
- Accedir a informació detallada del club, tornejos i equips.
- Veure el rànquing.
- Crear un equip o unir-se a un equip.

### Usuari Registrat (Capità d'Equip)
- Apuntar-se a tornejos.
- Fer reserves de classes.
- Veure informació detallada del seu equip.

### Usuari Registrat (Membre d'Equip)
- Veure informació detallada del seu equip.

### Treballador de Staff
- Reservar una pista per fer una classe.
- Afegir comentaris sobre una classe.

### Administrador
- Accedir a tota la informació de la web.
- Crear i gestionar tornejos.
- Gestionar equips.
- Veure i modificar el rànquing.

### Equips
- Els equips estan formats per jugadors i un capità (usuari que ha creat l’equip).

## Funcionalitats i Requisits a Implementar

### Multi-Sedes
- Filtrar per seus diferents del club.

### Comentaris
- Treballador de staff pot afegir comentaris sobre una classe.
- Usuari registrat pot afegir comentaris sobre una classe, un partit o un torneig del seu equip.

### Gestió de Jugadors
- Alta, baixa i modificació de la informació dels jugadors.
- Recerca per nom, cognom, sexe i nivell (c, c+, b, b+, a, professional).
- Llistat de jugadors segons puntuació.
- Rànquing calculat segons resultats en tornejos.

### Tornejos
- Alta de tornejos.
- Assignar jugadors/equips al torneig.
- Generació automàtica de partits segons fase i resultats.
- Classificació dels equips dins del torneig.
- Comentaris dels jugadors.

### Partits
- Alta de partits (manual o automàtica dins d’un torneig).
- Tipus de partits: amistós i de torneig.
- Apuntar estadístiques.
- Fer càlcul del rànquing.
- Comentaris dels jugadors.

### Càlcul del Rànquing
- Estadístiques de cada equip (punts a favor, punts en contra, victòries/derrotes).
- Punts per guanyar un partit, marcar punts, passar de ronda o guanyar un torneig.
- Puntuació reflectida al rànquing general.

### Classes Particulars
- Fitxa del jugador amb comentaris.
- Fitxa del staff amb comentaris.
- Planificació per al director esportiu.

## Estructura de la Base de Dades

La base de dades està estructurada per donar suport a les funcionalitats mencionades. Inclou les següents taules principals:

1. **Usuaris**: Informació dels usuaris registrats (jugadors, capitans, staff, administradors).
2. **Equips**: Informació dels equips i els seus membres.
3. **Tornejos**: Informació dels tornejos, equips participants i resultats.
4. **Partits**: Informació dels partits, tipus (amistós o de torneig) i estadístiques.
5. **Classes**: Informació de les classes, reserves i comentaris.
6. **Rànquing**: Puntuacions i classificacions dels equips.

## Instal·lació i Configuració

1. Cloneu el repositori:
   ```sh
   git clone <https://github.com/SerraSilvia/gestio_basquet.git>
