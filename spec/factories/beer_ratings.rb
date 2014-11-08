# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beer_rating do
    beer nil
    user nil
    rate 1
    review "MyString"
  end
end
