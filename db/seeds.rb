require "open-uri"

# puts 'Cleaning database...'
# Baby.destroy_all

# puts 'Creating Babies...'
# file = URI.open('https://res.cloudinary.com/dw4harw6z/image/upload/v1617095840/Baby_1_umrtjv.jpg')
# baby_1 = Baby.create(name:"Mario",birth_date: 20210328, weight: 2.4, height: 53, gender: "Fille")
# baby_1.photo.attach(io: file, filename: 'baby_1.jpg', content_type: 'image/jpg')
# puts "Created Baby 1 "

# file = URI.open('https://res.cloudinary.com/dw4harw6z/image/upload/v1617095801/Baby_2_dkgv0v.jpg')
# baby_2 = Baby.create(name:"Maria",birth_date: 20210327, weight: 3.7, height: 56, gender: "Garçon")
# baby_2.photo.attach(io: file, filename: 'baby_2.jpg', content_type: 'image/jpg')
# puts "Created Baby 2 "

# file = URI.open('https://res.cloudinary.com/dw4harw6z/image/upload/v1617095849/Baby_3_qrer8g.jpg')
# baby_3 = Baby.create(name:"Leo",birth_date: 20210227, weight: 3.0, height: 58, gender: "Garçon")
# baby_3.photo.attach(io: file, filename: 'baby_3.jpg', content_type: 'image/jpg')
# puts "Created Baby 3 "

# file = URI.open('https://res.cloudinary.com/dw4harw6z/image/upload/v1617108891/Baby_4_ugkjls.jpg')
# baby_4 = Baby.create(name:"Constantin",birth_date: 20210127, weight: 2.0, height: 48, gender: "Fille")
# baby_4.photo.attach(io: file, filename: 'baby_4.jpg', content_type: 'image/jpg')
# puts "Created Baby 4 "

# puts 'Finished!'

puts 'Cleaning database...'
Event.destroy_all
puts 'Creating Bibi...'
bibi = Event.create!(start_time: DateTime.new(2021,3,5,12,32,0) , end_time: DateTime.new(2021,3,5,12,35,0) , value_float: 150, comment:"a bu tout son bib", validated: true, baby_id: 26, user_id: 1)
bibi = Event.create!(start_time: DateTime.new(2021,3,5,12,32,0), end_time: DateTime.new(2021,3,5,12,35,0), value_float: 250, comment:"a fait son rot", validated: true, baby_id: 23, user_id: 1)
bibi = Event.create!(start_time: DateTime.new(2021,3,5,12,32,0), end_time: DateTime.new(2021,3,5,12,35,0), value_float: 200, comment:"a rien bu", validated: true, baby_id: 26, user_id: 1)
bibi = Event.create!(start_time: DateTime.new(2021,3,5,12,32,0), end_time: DateTime.new(2021,3,5,12,35,0), value_float: 300, comment:"a trop bu", validated: true, baby_id: 23, user_id: 1)
bibi = Event.create!(start_time: DateTime.new(2021,3,5,12,32,0), end_time: DateTime.new(2021,3,5,12,35,0), value_float: 400, comment:"aurait pu boire plus", validated: true, baby_id: 26, user_id: 1)
bibi = Event.create!(start_time: DateTime.new(2021,3,5,12,32,0), end_time: DateTime.new(2021,3,5,12,35,0), value_float: 500, comment:"a vomi", validated: true, baby_id: 23, user_id: 1)
puts "Bibi Created... "
puts 'Finished!'
