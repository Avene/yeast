FactoryGirl.define do
  factory :beer do
    name "Super Dry"
    beer_type :pilsner
    taste "Dry"

    factory :beer_without_name do
      name nil
    end
  end

end
