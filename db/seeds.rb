# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :role => 'admin')
ProjectType.create!(:name => 'application')
ProjectType.create!(:name => 'policy')
ProjectType.create!(:name => 'service')
Category.create!(:name => 'transport')
Category.create!(:name => 'development')
Category.create!(:name => 'environment')
Category.create!(:name => 'people')
Category.create!(:name => 'community')
Category.create!(:name => 'innovation')
Target.create!(:name => 'children')
Target.create!(:name => 'adults')
Target.create!(:name => 'ancients')
