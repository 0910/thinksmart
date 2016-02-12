# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :role => 'admin')
ProjectType.create!(:name => 'application')
ProjectType.create!(:name => 'policy')
ProjectType.create!(:name => 'service')
ProjectType.create!(:name => 'action')
ProjectType.create!(:name => 'other')
Category.create!(:name => 'transport')
Category.create!(:name => 'development')
Category.create!(:name => 'environment')
Category.create!(:name => 'people')
Category.create!(:name => 'community')
Category.create!(:name => 'innovation')
Target.create!(:name => 'children')
Target.create!(:name => 'youths')
Target.create!(:name => 'adults')
Target.create!(:name => 'ancients')
Target.create!(:name => 'all')

