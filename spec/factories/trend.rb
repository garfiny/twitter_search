# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trend do
    events Faker::Lorem.words(3)
    name   Faker::Name.name
    promoted_content ""
    query  Faker::Lorem.words(3)
    url    Faker::Internet.uri('http')
  end
end
