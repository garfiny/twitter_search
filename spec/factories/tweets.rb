FactoryGirl.define do
  factory :tweet do
    text Faker::Lorem.sentence(5)
    uri  Faker::Internet.uri('http')
    iso_language_code Faker::Locale.code

    after :build do |tweet, evaluator|
      tweet.user = build(:user)
      tweet.trend = build(:trend)
    end
  end
end
