# README

This README would normally document whatever steps are necessary to get the
application up and running.

* Ruby version: 2.2.4
* Rails Version: 5.0.0

* Database creation
	-> MySQL Datenbank benötigt
	-> create database focusapp_development;
	-> create database focusapp_test;
	-> create database focusapp_production;
	-> grant all privileges on focusapp_development.* to 'focusadmin'@'localhost' identified by 'focusgroupadmin';  <<<--- username und passwort und mail ändern
* Database initialization


* Configuration
-> Ruby Installieren
-> Konsole Öffnen
-> gem install bundler
-> gem install rack
Folgende Files ändern: app/config/database.yml <<<<-- username/passwort wie bei dem 'grant all' befehl 

-> In den Projektordner
	--> bundle install
	--> bundle update
	--> bei install Problemen: In den installierten ruby devkit folder, dann die befehle: "ruby dk.rb init", "ruby dk.rb install"
	--> rails db:migrate
	--> rails db:seed
	--> rails s
	--> über http://localhost:3000/admin in den Reiter 'User' -> eigenen Account -> edit -> 'role' auf admin setzen
	--> über http://localhost:3000  Seite Besuchen

* Deployment instructions
TODO