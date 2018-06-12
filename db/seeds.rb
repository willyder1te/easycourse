# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#do setup deleting all existing
Booking.delete_all
Course.delete_all
User.delete_all

puts "Everything should be deleted:  #{User.all.length} Users / #{Course.all.length} Courses / #{Booking.all.length} Bookings "

letters = ("a".."f").to_a
users = []
letters.each do |letter|
  user = User.create!(email: "#{letter}@#{letter}.#{letter}", password: "password")
  users << user
end

puts " #{User.all.length} Users created"

category = ["Film", "French", "Horse riding", "Wrestling"]
description = ["This is a fucking awesome course xD", "No description given"]
price = (5..25).to_a
location = ["Barcelona", "Paris", "Freiburg", "Istanbul"]
capacity = (1..15).to_a
prerequisite = ["No prerequisites neccessary"]
name = ["How to Tinder - by Willy", "Learn riding with Niklas", "Turkish 101 by Sezen", "French learning", "Watch Big Lebowski"]

number_of_courses = 10
courses = []
number_of_courses.times do
  course = Course.create(user_id: users.sample.id, category: category.sample, start_date: (DateTime.now+1), end_date: (DateTime.now + 1 + 2/24.0), description: description.sample, location: location.sample, price: price.sample, capacity: capacity.sample, prerequisite: prerequisite.sample, name: name.sample)
  courses << course
end

puts "#{Course.all.length} Courses created"

# Until here everything works locally
# The following might cause some conflicts with Niklas work, please resolve it.
number_of_bookings = 15
number_of_bookings.times do
  Booking.create(user_id: users.sample.id, course_id: courses.sample.id)
end

puts "#{Booking.all.length} Bookings created"


