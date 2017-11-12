FactoryBot.define do
  factory :article do
    sequence(:title) { Faker::Lorem.sentence }
    text
    user
  end
end
