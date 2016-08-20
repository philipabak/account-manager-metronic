# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'test@user.com', password: '098f6bcd4621d373cade4e832627b4f6', location_id: '1')
Location.create(name: 'Loc1')
Location.create(name: 'Loc2')
Location.create(name: 'Loc3')
