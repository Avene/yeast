require 'rails_helper'

RSpec.describe Beer, :type => :model do
  it "is valid with name, beer_type and taste" do
    valid_beer = build(:beer)
    expect(valid_beer).to be_valid
  end

  it "is invalid without name" do
    name_blank_beer = build(:beer, name: nil)
    expect(name_blank_beer).not_to be_valid
    expect(name_blank_beer.errors.keys).to contain_exactly(:name)
  end

  it "is invalid without beer_type" do
    type_blank_beer = build(:beer, beer_type: nil)
    expect(type_blank_beer).not_to be_valid
    expect(type_blank_beer.errors.keys).to contain_exactly(:beer_type)
  end

  # it "is invalid with non-enum defined beer_type value" do
    # specify { expect { Beer.new(beer_type: 4) }.to raise_error(ArgumentError) }
    # expect(FactoryGirl.build(:beer, beer_type: 5)).to raise_error(ArgumentError)
  # end

  it "is invalid without taste" do
    taste_blank_beer = build(:beer, taste: nil)
    expect(taste_blank_beer).not_to be_valid
    expect(taste_blank_beer.errors.keys).to contain_exactly(:taste)
  end

  it "has a valid factory" do
    expect(build(:beer)).to be_valid
  end
end
