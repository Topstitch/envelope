# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Label.create([{name: 'me'}, {name: 'family'}, {name: 'friends'}, {name: 'katies'}, {name: 'davids'}])

Label.create([{name: 'parent'}, {name: 'child'}, {name: 'partner'}, {name: 'spouse'}])

Label.create([{name: 'needs_address'}, {name: 'needs_design'}, {name: 'needs_card'}, {name: 'needs_supplies'}, {name: 'needs_packaging'}, {name: 'needs_to_be_mailed'}, {name: 'needs_thank_you'}, {name: 'needs_response'}])
