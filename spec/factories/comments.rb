FactoryBot.define do
  factory :comment do
    sequence(:body) { Faker::Lorem.sentence }
    article
    user
  end
end
