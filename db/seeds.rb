require "open-uri"

puts 'Cleaning database...'
Event.destroy_all
puts 'Event destroyed...'
BabyUser.destroy_all
puts 'BabyUser destroyed...'
Baby.destroy_all
puts 'Baby destroyed...'
User.destroy_all
puts 'User destroyed...'

puts 'Creating Users...'

yoann = User.create!(email: "yoann@yoann.ch", password: "123456" )
puts "Created user yoann "
ophelie = User.create!(email: "ophelie@ophelie.ch", password: "123456")
puts "Created user ophelie "
benjamin = User.create!(email: "benjamin@benjamin.ch", password: "123456")
puts "Created user benjamin "

puts 'Creating Babies...'
file = URI.open('https://res.cloudinary.com/dw4harw6z/image/upload/v1617790404/Babies/L%C3%A9o_Baby_born_kohosg.jpg')
leo = Baby.create!(name:"Léo",birth_date: 20180222, weight: 2.4, height: 45, gender: "Garçon")
leo.photo.attach(io: file, filename: 'baby_1.jpg', content_type: 'image/jpg')
puts "Baby Leo is born"

file = URI.open('https://res.cloudinary.com/dw4harw6z/image/upload/v1617095801/Baby_2_dkgv0v.jpg')
lea = Baby.create!(name:"Léa",birth_date: 20210227, weight: 3.7, height: 48, gender: "Fille")
lea.photo.attach(io: file, filename: 'baby_2.jpg', content_type: 'image/jpg')
puts "Created Léa "

file = URI.open('https://res.cloudinary.com/dw4harw6z/image/upload/v1617095849/Baby_3_qrer8g.jpg')
constantin = Baby.create!(name:"Constantin",birth_date: 20210127, weight: 3.5, height: 43, gender: "Garçon")
constantin.photo.attach(io: file, filename: 'baby_2.jpg', content_type: 'image/jpg')
puts "Created Constantin "

file = URI.open('https://res.cloudinary.com/dw4harw6z/image/upload/v1617108891/Baby_4_ugkjls.jpg')
soraya = Baby.create!(name:"Soraya",birth_date: 20210127, weight: 3.5, height: 43, gender: "Fille")
soraya.photo.attach(io: file, filename: 'baby_2.jpg', content_type: 'image/jpg')
puts "Created Soraya"

puts 'Creating Baby_users...'
roles_mario = BabyUser.create!(role: "parent", baby: mario, user: yoann)
puts "Created roles_mario "
roles_lea = BabyUser.create!(role: "parent", baby: lea, user: yoann)
puts "Created roles_lea "
roles_constantin = BabyUser.create!(role: "parent", baby: constantin, user: ophelie)
puts "Created roles_constantin "
roles_soraya = BabyUser.create!(role: "parent", baby: soraya, user: benjamin)
puts "Created roles_soraya "


puts 'Creating Events...'
Event.create!(type: "Biberon",start_time: DateTime.new(2021,3,6,12,46,0), end_time: DateTime.new(2021,3,5,12,47,0), value_float: 250, comment:"a fait son rot", validated: true, baby: lea, user: yoann)
puts "Created event bibreon"
Event.create!(type: "Biberon", start_time: DateTime.new(2021,3,7,12,47,0), end_time: DateTime.new(2021,3,5,12,48,0), value_float: 200, comment:"a rien bu", validated: true, baby: lea, user: yoann)
puts "Created event dodo"
Event.create!(type: "Biberon", start_time: DateTime.new(2021,3,8,12,48,0), end_time: DateTime.new(2021,3,5,12,49,0), value_float: 300, comment:"a trop bu", validated: true, baby: constantin, user: ophelie )
puts "Created event repas"
Event.create!(type: "Biberon", start_time: DateTime.new(2021,3,9,12,49,0), end_time: DateTime.new(2021,3,5,12,50,0), value_float: 400, comment:"aurait pu boire plus", validated: true, baby: lea, user: yoann )
puts "Created event vaccin "
Event.create!(type: "Biberon", start_time: DateTime.new(2021,3,10,12,50,0), end_time: DateTime.new(2021,3,5,12,51,0), value_float: 500, comment:"a vomi", validated: true, baby: mario, user: yoann )
puts "Created event couche"
Event.create!(type: "Biberon", start_time: DateTime.new(2021,3,9,12,49,0), end_time: DateTime.new(2021,3,5,12,54,0), value_float: 600, comment:"aurait pu boire plus bis", validated: true, baby: soraya, user: benjamin)
puts "Created dodo"
puts "Events Created... "
puts 'Finished!'
