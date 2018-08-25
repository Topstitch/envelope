# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

household1 = Household.create(name: 'Goat', notes: 'important goaty thoughts', anniversary: Time.now + 1.month)
household2 = Household.create(name: 'Rabbit', notes: 'important rabbity thoughts', anniversary: Time.now + 1.week)

contact1 = Contact.create(first: 'Esmeralda', last: 'Goat', middle: 'Lillian', household_id: household1.id, phone: '123-456-7890', email: 'esme@goatmail.com', notes: 'Esmeralda is the best; her secondary phone is 890-567-1234', birthday: 1.month.ago)
contact2 = Contact.create(first: 'Lawrence', last: 'Goat', household_id: household1.id, phone: '123-456-7990', email: 'lawrence@goatmail.com', birthday: 1.year.ago)
contact3 = Contact.create(first: 'Juniper', last: 'Rabbit', middle: 'Hopper', household_id: household2.id, phone: '987-456-7890', email: 'bunny@carrotmail.com')
contact4 = Contact.create(first: 'Solo', last: 'Ostrich')

address1 = Address.create(to: 'Esme the Magnificent', line_1: '123 Test Lane', line_2: 'Apartment # 3', city: 'Durham', state: 'NC', zip: '123456-7890', country: 'US', category: 'primary', household_id: household1.id, verified_at: 1.week.ago, notes: 'will be moving soon')

list1 = List.create(name: 'Christmas 2018', notes: 'going to be organized this time')

correspondence1 = Correspondence.create(from_id: contact1.id, from_type: 'Contact', to_id: household1.id, to_type: 'Household', category: 'card', occasion: 'Christmas', status: 'sent', list_id: list1.id, cost: 45.50, notes: 'expensive airmail')

label1 = Label.create(name: 'family')