# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.create!(name:     "admin",
                     email:    "admin@test.com",
                     password: "password",
                     password_confirmation: "password")
admin.toggle!(:admin)
10.times do |n|
  name  = Faker::Name.name
  email = "user-#{n+1}@test.com"
  password  = "password"
  User.create!(name:     name,
               email:    email,
               password: password,
               password_confirmation: password)
end


  150.times do
    name = Faker::Commerce.product_name
    price = Faker::Commerce.price
    description = Faker::Lorem.sentence
    category = ['First course', 'Main course', 'Drink']
    weekday = [Date.today, Date.yesterday, Date.yesterday.yesterday, Date.tomorrow]
    Item.create!(name:     name,
                 price:    price,
                 description: description,
                 a_day_of_week: weekday.shuffle![0],
                 category: category.shuffle![0]
    )
  end



#





