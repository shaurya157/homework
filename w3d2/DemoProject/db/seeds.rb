# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

House.create(name: 'Apartment')
House.create(name: 'Suburb')
House.create(name: 'Beach House')

People.create(name: 'Person3', house_id: 3)
People.create(name: 'Person4', house_id: 2)
People.create(name: 'Person5', house_id: 1)
