# Gestion_Conges

1. Base de données

a) Se connecter à l'interpreteur mysql
  mysql -u root -p ( mot de passe : tonystark sur la VM)

b) Créer la base de données, les tables et les données
  source lien_vers_fichier.sql (exemple : source base-projet.sql (fichier dispo dans le dossier livrables))


2. Environnement

a) Lancer l'IDE Eclipse

b) Ajouter le JRE 12
  Window > Preferences > Java > Installed JREs
  Add.. > Standard VM (next)
    JRE home : dossier_du_jre (exemple : /usr/lib/jvm/jdk-13.0.1) (finish)

c) Ajouter le serveur Tomcat 9
  Servers > New > Serveur > Tomcat v9 (next)
    Name : Apache Tomcat v9.0,
    Tomcat installation directory : download and install...,
    JRE : Workbench default JRE


3. Application

a) Télécharger le projet
  git clone https://github.com/yPerrot/Gestion_Conges.git

b) Ouvrir le projet
  File > Open Projects from File System... > Directory
  Selectionner le dossier précédemment telechargé

c) Ajouter l'application sur le Tomcat
  Apache Tomcat v9.0 > Add and Remove... > Select ProjetJEE > Add > Finish

d) Ajouter JRE au Java Build Path du projet
  Clique droit sur le projet > Properties > Java Build Path
  JRE System Library > Edit... > Workspace default JRE (jdk-13.0.1)

e) Configurer la connection à la base de données
  Fichier config.properties

f) Lancer le serveur d'application


4. Lancement

a) Ouvrir le naviguateur et acceder à l'application
  url : localhost:8080/ProjetJEE
