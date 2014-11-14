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

  it "is invalid without taste" do
    taste_blank_beer = build(:beer, taste: nil)
    expect(taste_blank_beer).not_to be_valid
    expect(taste_blank_beer.errors.keys).to contain_exactly(:taste)
  end

  it "has a valid factory" do
    expect(build(:beer)).to be_valid
  end

  describe 'returns a rate average' do
    before :each do
      # 9 / 7 = 1.285....
      @beer_rated_1point285 = create(:beer, name: 'beer_1285')
      create(:beer_rating, beer: @beer_rated_1point285, rate: 2)
      create(:beer_rating, beer: @beer_rated_1point285, rate: 2)
      create(:beer_rating, beer: @beer_rated_1point285, rate: 1)
      create(:beer_rating, beer: @beer_rated_1point285, rate: 1)
      create(:beer_rating, beer: @beer_rated_1point285, rate: 1)
      create(:beer_rating, beer: @beer_rated_1point285, rate: 1)
      create(:beer_rating, beer: @beer_rated_1point285, rate: 1)

      # 13 / 9 = 1.444...
      @beer_rated_1_point_444 = create(:beer, name: 'beer_1444')
      create(:beer_rating, beer: @beer_rated_1_point_444, rate: 1)
      create(:beer_rating, beer: @beer_rated_1_point_444, rate: 1)
      create(:beer_rating, beer: @beer_rated_1_point_444, rate: 1)
      create(:beer_rating, beer: @beer_rated_1_point_444, rate: 1)
      create(:beer_rating, beer: @beer_rated_1_point_444, rate: 1)
      create(:beer_rating, beer: @beer_rated_1_point_444, rate: 1)
      create(:beer_rating, beer: @beer_rated_1_point_444, rate: 1)
      create(:beer_rating, beer: @beer_rated_1_point_444, rate: 1)
      create(:beer_rating, beer: @beer_rated_1_point_444, rate: 5)

    end

    it "rounded 5 up to two decimal places" do
      expect(@beer_rated_1point285.average_rating).to eq 1.29
    end

    it "rounded 4 down to two decimal places" do
      expect(@beer_rated_1_point_444.average_rating).to eq 1.44
    end
  end

  describe 'filtered by average ratings' do
    before (:each) do
      @beer1 = create(:beer, name: 'SuperDry')
      create(:beer_rating, rate: 5, beer: @beer1)
      create(:beer_rating, rate: 4, beer: @beer1)

      @beer2 = create(:beer, name: 'Guiness')
      create(:beer_rating, rate: 4, beer: @beer2)
      create(:beer_rating, rate: 3, beer: @beer2)

      @beer3 = create(:beer, name: 'Premium Molts')
      create(:beer_rating, rate: 3, beer: @beer3)
      create(:beer_rating, rate: 2, beer: @beer3)

      @beer4 = create(:beer, name: 'Black Label')
      create(:beer_rating, rate: 2, beer: @beer4)
      create(:beer_rating, rate: 1, beer: @beer4)

      @beer5 = create(:beer, name: 'Heineken')
    end

    it 'expect returns beers whose ratings over specified value' do
      expect(Beer.rated_than(3)).to match_array([@beer1, @beer2])
    end

    it 'omits results that do not match' do
      expect(Beer.rated_than(1)).not_to include [@beer4, @beer5]
    end
  end
end
