FactoryGirl.define do
  factory :user do
    description "a soccer player"
    lang        %w(en es zh-cn)
    location    "Melbourne, AU"
    name        "Lionel Messi"
    screen_name "Messi"
    withheld_in_countries %w(GR, HK, MY)
  end
end
