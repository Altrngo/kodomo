require "open-uri"

puts 'Cleaning database...'
Baby.destroy_all

puts 'Creating Babies...'
file = URI.open('https://res.cloudinary.com/dw4harw6z/image/upload/v1617095840/Baby_1_umrtjv.jpg')
baby_1 = Baby.create(name:"Mario",birth_date: 20210328, weight: 2.4, height: 53, gender: "female")
baby_1.photo.attach(io: file, filename: 'baby_1.jpg', content_type: 'image/jpg')
puts "Created Baby 1 "

file = URI.open('https://res.cloudinary.com/dw4harw6z/image/upload/v1617095801/Baby_2_dkgv0v.jpg')
baby_2 = Baby.create(name:"Maria",birth_date: 20210327, weight: 3.7, height: 56, gender: "male")
baby_2.photo.attach(io: file, filename: 'baby_2.jpg', content_type: 'image/jpg')
puts "Created Baby 2 "

file = URI.open('https://res.cloudinary.com/dw4harw6z/image/upload/v1617095849/Baby_3_qrer8g.jpg')
baby_3 = Baby.create(name:"Leo",birth_date: 20210227, weight: 3.0, height: 58, gender: "male")
baby_3.photo.attach(io: file, filename: 'baby_3.jpg', content_type: 'image/jpg')
puts "Created Baby 3 "

puts 'Finished!'
