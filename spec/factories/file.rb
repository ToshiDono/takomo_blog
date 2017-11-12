FactoryBot.define do
  sequence :text do
    Faker::Lorem.paragraphs(2)
  end
end
