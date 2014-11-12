# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "kent.#{n}.beck@example.com"}
    # email Faker::Internet.email
    name "kent beck"
    password "good_password"
    password_confirmation "good_password"
  end
end
