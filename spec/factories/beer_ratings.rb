# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beer_rating do
    association :beer
    association :user, factory: :user
    rate 1
    review "MyString"
  end
end
