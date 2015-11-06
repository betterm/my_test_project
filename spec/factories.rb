FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "User #{n}" }
    sequence(:email) { |n| "user_#{n}@test.com"}
    password "password"
    password_confirmation "password"

    factory :admin do
      admin true
    end
  end

  factory :item do
    name "Item"
    price 10.00
    description "Item description"
    a_day_of_week Date
    category "First course"
  end


end