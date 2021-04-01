require "open-uri"

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
