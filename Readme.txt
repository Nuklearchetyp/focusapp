http://rubyinstaller.org/downloads/

ruby 2.2.4 + dazugehöriges DevKit
rails 5.0.0
KEINE UNTERSCHIEDLCIHEN BIT VERSIONEN

devkit folder:
		- ruby dk.rb init
		- ruby dk.rb install


gem install bundler
gem install rack
->ProjektOrdner:
	-bundle install
	-bundle update
	-rake db:migrate
	-rake db:seed

app/config/database.yml -> username passowrd database anpassen, dann grant all in sql workbench


Admin erstellen:
rails c ->  User.create!(:email => 'admin@focus.com',:first_name => 'Super', :last_name => 'Admin', :password => '123456', :password_confirmation => '123456')
		->	AdminUser.create!(:email => 'admin@focus.com', :password => '123456', :password_confirmation => '123456') <--- Eigene Werte einsetzen
-> über http://Url-der-seite/admin in den Reiter 'User' -> erstellten accout -> edit -> 'role' -> admin

Server Starten:	-rails s


User:
admin@focus.com
leader@focus.com
mod@focus.com
user1@focus.com
user2@focus.com


Farben:
#3b3a36
#b3c2bf
#e9ece5
#c0dfd9

 USA: 23. 8. - 6. 9