# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Some Dude",
             email: "dputnam@ccsf.edu",
             password:              "t0pS3cret!",
             password_confirmation: "t0pS3cret!",
             activated: true,
             activated_at: Time.zone.now)
 
User.create!(name:  "NEW ADMIN USER",
             email: "ADMIN_USER@SOMEDOMAIN.COM",
             password:              "SECRET_PASSWORD",
             password_confirmation: "SECRET_PASSWORD",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)
              
#User.create!(name:  "Example User",
#             email: "example@railstutorial.org",
#             password:              "foobar",
#             password_confirmation: "foobar",
#             admin: true,
#             activated: true,
#             activated_at: Time.zone.now)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "fooBar_fOO",
             password_confirmation: "fooBar_fOO",
             activated_at: Time.zone.now)


99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
