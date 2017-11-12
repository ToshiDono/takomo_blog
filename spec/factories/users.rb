FactoryBot.define do
  factory :user do
    sequence(:name) { Faker::StarTrek.character }
    sequence(:surname) { Faker::LordOfTheRings.character }
    sequence(:email) { |n| "user#{n}@user.com" }
    password '123123'
  end
end