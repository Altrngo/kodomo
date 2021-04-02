require "open-uri"

# puts 'Cleaning database...'
# Event.destroy_all
# puts 'Creating Bibi...'
# bibi = Event.create!(start_time: DateTime.new(2021,3,6,12,46,0), end_time: DateTime.new(2021,3,5,12,47,0), type: "Biberon", value_float: 250, comment:"a fait son rot", validated: true, baby_id: 30, user_id: 1)
# bibi = Event.create!(start_time: DateTime.new(2021,3,7,12,47,0), end_time: DateTime.new(2021,3,5,12,48,0), type: "Repas", value_float: 200, comment:"a rien bu", validated: true, baby_id: 23, user_id: 1)
# bibi = Event.create!(start_time: DateTime.new(2021,3,8,12,48,0), end_time: DateTime.new(2021,3,5,12,49,0), type: "Dodo", value_float: 300, comment:"a trop bu", validated: true, baby_id: 30, user_id: 1)
# bibi = Event.create!(start_time: DateTime.new(2021,3,9,12,49,0), end_time: DateTime.new(2021,3,5,12,50,0), type: "Couche", value_float: 400, comment:"aurait pu boire plus", validated: true, baby_id: 23, user_id: 1)
# bibi = Event.create!(start_time: DateTime.new(2021,3,10,12,50,0), end_time: DateTime.new(2021,3,5,12,51,0), type: "Biberon", value_float: 500, comment:"a vomi", validated: true, baby_id: 30, user_id: 1)
# bibi = Event.create!(start_time: DateTime.new(2021,3,9,12,49,0), end_time: DateTime.new(2021,3,5,12,54,0), type: "Repas", value_float: 600, comment:"aurait pu boire plus bis", validated: true, baby_id: 23, user_id: 1)
# puts "Bibi Created... "
# puts 'Finished!'
puts 'Creating Babies...'
file = URI.open('https://res.cloudinary.com/dw4harw6z/image/upload/v1617095840/Baby_1_umrtjv.jpg')
baby_1 = Baby.create!(name:"Mario",birth_date: 20210328, weight: 2.4, height: 53, gender: "Fille")
baby_1.photo.attach(io: file, filename: 'baby_1.jpg', content_type: 'image/jpg')
puts "Created Baby 1 "

# file = URI.open('https://res.cloudinary.com/dw4harw6z/image/upload/v1617095801/Baby_2_dkgv0v.jpg')
# baby_2 = Baby.create!(name:"Maria",birth_date: 20210327, weight: 3.7, height: 56, gender: "Garçon")
# baby_2.photo.attach(io: file, filename: 'baby_2.jpg', content_type: 'image/jpg')
# puts "Created Baby 2 "

# file = URI.open('https://res.cloudinary.com/dw4harw6z/image/upload/v1617095849/Baby_3_qrer8g.jpg')
# baby_3 = Baby.create!(name:"Leo",birth_date: 20210227, weight: 3.0, height: 58, gender: "Garçon")
# baby_3.photo.attach(io: file, filename: 'baby_3.jpg', content_type: 'image/jpg')
# puts "Created Baby 3 "

# file = URI.open('https://res.cloudinary.com/dw4harw6z/image/upload/v1617108891/Baby_4_ugkjls.jpg')
# baby_4 = Baby.create!(name:"Constantin",birth_date: 20210127, weight: 2.0, height: 48, gender: "Garçon")
# baby_4.photo.attach(io: file, filename: 'baby_4.jpg', content_type: 'image/jpg')
# puts "Created Baby 4 "

puts 'Cleaning database...'
Event.destroy_all
puts 'Creating Bibi...'
bibi = Event.create!(start_time: DateTime.new(2021,3,6,12,46,0), end_time: DateTime.new(2021,3,5,12,47,0), value_float: 250, comment:"a fait son rot", validated: true, baby_id: 30, user_id: 1)
bibi = Event.create!(start_time: DateTime.new(2021,3,7,12,47,0), end_time: DateTime.new(2021,3,5,12,48,0), value_float: 200, comment:"a rien bu", validated: true, baby_id: 23, user_id: 1)
bibi = Event.create!(start_time: DateTime.new(2021,3,8,12,48,0), end_time: DateTime.new(2021,3,5,12,49,0), value_float: 300, comment:"a trop bu", validated: true, baby_id: 30, user_id: 1)
bibi = Event.create!(start_time: DateTime.new(2021,3,9,12,49,0), end_time: DateTime.new(2021,3,5,12,50,0), value_float: 400, comment:"aurait pu boire plus", validated: true, baby_id: 23, user_id: 1)
bibi = Event.create!(start_time: DateTime.new(2021,3,10,12,50,0), end_time: DateTime.new(2021,3,5,12,51,0), value_float: 500, comment:"a vomi", validated: true, baby_id: 30, user_id: 1)
bibi = Event.create!(start_time: DateTime.new(2021,3,9,12,49,0), end_time: DateTime.new(2021,3,5,12,54,0), value_float: 600, comment:"aurait pu boire plus bis", validated: true, baby_id: 23, user_id: 1)
puts "Bibi Created... "
puts 'Finished!'

# puts 'Cleaning database...'
# Event.destroy_all
# puts 'Creating Bibi...'
# bibi = Event.create!(type: "BabyBottle", start_time: 20210330112613, end_time: 20210330113530, value_float: 150, comment:"a bu tout son bib", validated: true, baby_id: 1, user_id: 1)
# puts "Bibi Created... "
# puts 'Finished!'


puts 'Cleaning database...'
Event.destroy_all
puts 'Creating Bibi...'
bibi = Event.create!(start_time: DateTime.new(2021,3,5,12,32,0) , end_time: DateTime.new(2021,3,5,12,35,0) , value_float: 150, comment:"a bu tout son bib", validated: true, baby_id: 1, user_id: 1)
puts "Bibi Created... "
puts 'Finished!'

