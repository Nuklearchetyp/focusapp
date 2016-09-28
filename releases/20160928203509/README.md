# README

This README would normally document whatever steps are necessary to get the
application up and running.

* Ruby version: 2.2.2 +
* Rails Version: 5.0.0 +

* Umgebung einrichten
1) Ruby Version 2.2.2 aufwärts runterladen: http://rubyinstaller.org/downloads/
Bei Installation alles ankreuzen(Umgebungsvariable wichtig)
Konsole: ruby -v um zu checken ob die Installation erfolgreich war

2) Git installieren. Konsole: git -v um zu checken ob die Installation erfolgreich war

3) Ruby Devkit Installieren http://rubyinstaller.org/downloads/ 	

4) Im den Devkit Installationsordner Konsole öffnen und folgende Befehle einegeben: 
*ruby dk.rb init
*ruby dk.rb install

5) Konsole irgendwo öffnen und folgenden Befehl: 
*gem install bundler

6) Konsole im Projektordner öffnen und folgende Befehle ausfähren:
*bundle
*bundle update
*bundle install

7) MySQL Server und Workbench von http://dev.mysql.com/downloads/ herunterladen

8) Neue Database mit MySQL erstellen mit folgenden Befehlen:
*create database focusapp_development
*create database focusapp_test
*create database focusapp_production

9) Datei im Projekt öffnen: focusapp\config\database.yml
Hier in den Zeilen username und password die gewünschten Username und Passwort eingeben.
Zurück in SQL Workbench folgende Befehle: 
*use focusapp_development;
ACHTUNG: In den Folgenden Befehlen die Werte von username und password mit denen austauschen, die man im "focusapp\config\database.yml" - File gesetzt hat.
*grant all privileges on focusapp_development.* to 'username'@'localhost' indentified by 'password';
*grant all privileges on focusapp_test.* to 'username'@'localhost' indentified by 'password';

10) Im Projektordner Kommandozeile öffnen und folgende Kommandos eingeben: 
*rails db:migrate
*rails db:seed 

11) Server Starten: Kommando im Projektordner
*rails s

12) Admin einrichten:
Browser öffnen:
Link: http://localhost:3000/admin
einloggen mit username: admin@focus.com passwort: 123456
Oben in Reiter "User" Admin ganz rechts "edit" dann Role zu "admin" ändern.
Dann auf Seite: http://localhost:3000 und mit admin@focus.com passwort 123456 anmelden.

Fertig


