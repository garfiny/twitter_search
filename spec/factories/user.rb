FactoryGirl.define do
  factory :user do
    description "a soccer player"
    lang        "en"
    location    "Melbourne, AU"
    name        "Lionel Messi"
    screen_name "Messi"
    withheld_in_countries "GR, HK, MY"
  end
end
