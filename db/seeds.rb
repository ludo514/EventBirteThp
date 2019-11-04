# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy_all

u = []
e = []

10.times do |index|
	u << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10),email: Faker::Name.first_name + "@yopmail.com", encrypted_password:"ludo")
	puts "User : #{Faker::Name.first_name}"
end

10.times do |index|
	e << Event.create(administrator: u.sample,start_date: Faker::Time.forward(days: 28), duration: 50, description: Faker::Lorem.sentence(word_count: 10),title: Faker::Book.title, location:"Paris",price: rand(1..1000))
	puts "Event : #{Faker::Time.forward(days: 28)}"
end

10.times do |index|
	Attendance.create(user: u.sample, event: e.sample)
	puts "Participation crée"
end
