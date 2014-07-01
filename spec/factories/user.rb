FactoryGirl.define do
  factory :user do
    location_code = Faker::Locale.code
    description "a soccer player"
    lang        location_code
    location    "#{Faker::Locale.language(location_code)}, #{location_code}"
    name        Faker::Name.name
    screen_name Faker::Name.name
  end
end
