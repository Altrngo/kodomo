puts 'Cleaning database...'
Baby.destroy_all

puts 'Creating Babies...'
baby_1 = Baby.create(name:"Mario",birth_date: 20210328, weight: 2.4, height: 53, gender: "female")
puts "Created Baby 1 "

baby_2 = Baby.create(name:"Maria",birth_date: 20210327, weight: 3.7, height: 56, gender: "male")
puts "Created Baby 2 "

baby_3 = Baby.create(name:"Leo",birth_date: 20210227, weight: 3.0, height: 58, gender: "male")
puts "Created Baby 3 "

puts 'Finished!'
