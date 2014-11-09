require 'rails_helper'

RSpec.describe BeerRating, :type => :model do
  it "is valid when associated to existing beer and user, with rate and review" do
    valid_beer_rating = build(:beer_rating)
    expect(valid_beer_rating).to be_valid
  end

  it "is invalid without association of existing beer" do
    beer_rating = build(:beer_rating, beer: nil)
    expect(beer_rating).not_to be_valid
    expect(beer_rating.errors.keys).to contain_exactly(:beer)
  end

  it "is invalid without association of existing user" do
    beer_rating = build(:beer_rating, user: nil)
    expect(beer_rating).not_to be_valid
    expect(beer_rating.errors.keys).to contain_exactly(:user)
  end

  it "is invalid without rate" do
    beer_rating = build(:beer_rating, rate: nil)
    expect(beer_rating).not_to be_valid
    expect(beer_rating.errors.keys).to contain_exactly(:rate)
  end

  it "is valid when rate is 5" do
    beer_rating = build(:beer_rating, rate: 5)
    expect(beer_rating).to be_valid
  end

  it "is invalid when rate is more than 5" do
    beer_rating = build(:beer_rating, rate: 6)
    expect(beer_rating).not_to be_valid
    expect(beer_rating.errors.keys).to contain_exactly(:rate)
  end

  it "is valid when rate is 1" do
    beer_rating = build(:beer_rating, rate: 1)
    expect(beer_rating).to be_valid
  end

  it "is invalid when rate is less than 1" do
    beer_rating = build(:beer_rating, rate: 0)
    expect(beer_rating).not_to be_valid
    expect(beer_rating.errors.keys).to contain_exactly(:rate)
  end

  it "is valid without review" do
    beer_rating = build(:beer_rating, review: nil)
    expect(beer_rating).to be_valid
  end
end
