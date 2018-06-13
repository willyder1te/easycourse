# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

#do setup deleting all existing
Booking.delete_all
Course.delete_all
User.delete_all

puts "Everything should be deleted:  #{User.all.length} Users / #{Course.all.length} Courses / #{Booking.all.length} Bookings "

avatar_photo_url = ["http://facelab.org/People/images/smile/Jaimie.jpg","http://facelab.org/People/images/smile/holzleitner.jpg","http://facelab.org/People/images/smile/fasolt.jpg","http://facelab.org/People/images/smile/Rebecca.jpg","http://facelab.org/People/images/smile/Lindsay.jpg","http://facelab.org/People/images/smile/ben", "http://facelab.org/People/images/smile/Ant", "http://facelab.org/People/images/smile/hahn"]


letters = ("a".."c").to_a
users = []
letters.each do |letter|
  user = User.create!(
            email: "#{letter}@#{letter}.#{letter}",
            password: "password",
            name:Faker::HowIMetYourMother.character,
            location: Faker::GameOfThrones.city,
            phone: Faker::PhoneNumber.phone_number,
            description: Faker::Lorem.sentence,
            remote_photo_url: avatar_photo_url.sample)
  users << user
end

puts " #{User.all.length} Users created"

category = ["Film", "French", "Horse riding", "Wrestling"]
description = ["This is a fucking awesome course", "No description given"]
price = (5..25).to_a
capacity = (1..15).to_a
prerequisite = ["No prerequisites neccessary"]
name = ["How to Tinder - by Willy", "Learn riding with Niklas", "Turkish 101 by Sezen", "French learning", "Watch Big Lebowski"]


course_photo_url = [
          "https://images.unsplash.com/photo-1490424660416-359912d314b3?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=75849dd2a245dded86c3bfdfdd69d28c&auto=format&fit=crop&w=1050&q=80",
          "https://images.unsplash.com/photo-1528701202755-cf9158dc3da6?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c072549944daeba2ee1229f21ecdd45e&auto=format&fit=crop&w=1039&q=80",
          "https://images.unsplash.com/photo-1524646514133-d392bcf4e8b9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ba364557b0c2c0a865108d2bd255565&auto=format&fit=crop&w=1051&q=80",
          "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=37c91c8e3f63462e0739c676dfe8fee8&auto=format&fit=crop&w=1050&q=80",
          "https://images.unsplash.com/photo-1519262209391-1e800110f723?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d9a8cd30ee4c7d0cfb5bb874e0c9b89b&auto=format&fit=crop&w=1050&q=80",
          "https://images.unsplash.com/photo-1511949860663-92c5c57d48a7?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=97b08b2596c6a45168b3ae9e766010e0&auto=format&fit=crop&w=1050&q=80",
          "https://images.unsplash.com/photo-1503824475106-01c19f544ebf?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d7239b2dd9b133144a303bc83a034bdb&auto=format&fit=crop&w=1049&q=80",
          "https://images.unsplash.com/photo-1517130038641-a774d04afb3c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3b3ee8e35af1e664b13f70ef440fd441&auto=format&fit=crop&w=1050&q=80",
          "https://images.unsplash.com/photo-1525725296312-37c06d2338ba?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=efff2c95e65d53c621a19ab33fd434a9&auto=format&fit=crop&w=1050&q=80",
          "https://images.unsplash.com/photo-1471565661762-b9dfae862dbe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=df9e89a26072d94a6b9c86b5430eabd7&auto=format&fit=crop&w=1050&q=80"]
courses = []

users.each do |user|
  6.times do
    course = Course.create(
          user_id: user.id,
          category: category.sample,
          start_date: (DateTime.now+1),
          end_date: (DateTime.now + 1 + 2/24.0),
          description: Faker::HarryPotter.quote,
          location: Faker::GameOfThrones.city,
          price: price.sample,
          capacity: capacity.sample,
          prerequisite: prerequisite.sample,
          name: Faker::Superhero.descriptor,
          remote_photo_url: course_photo_url.sample)
    courses << course
  end
end

puts "#{Course.all.length} Courses created"

# Until here everything works locally
# The following might cause some conflicts with Niklas work, please resolve it.


users.each do |user|
  courses_shuffle = courses.shuffle.first(5)
  courses_shuffle.each do |course|
    Booking.create(
          user_id: user.id,
          course_id: course.id)

  end
end

puts "#{Booking.all.length} Bookings created"


