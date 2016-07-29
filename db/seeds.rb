# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
['user', 'admin', 'projectleader'].each do |role|
  Role.find_or_create_by({name: role})
end
User.create!(:email => 'admin@focus.com',:first_name => 'Admin', :last_name => 'Admin', :password => '123456', :password_confirmation => '123456')
AdminUser.create!(:email => 'admin@focus.com', :password => '123456', :password_confirmation => '123456')