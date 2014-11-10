require 'rails_helper'

RSpec.describe BeerRating, :type => :model do
  describe 'validations' do

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

  describe 'scopes' do
    before :each do
      user_with_5_ratings = create(:user)
      @rate_1 = create(:beer_rating, rate: 1, user: user_with_5_ratings)
      @rate_2 = create(:beer_rating, rate: 2, user: user_with_5_ratings)
      @rate_3 = create(:beer_rating, rate: 3, user: user_with_5_ratings)
      @rate_4 = create(:beer_rating, rate: 4, user: user_with_5_ratings)
      @rate_5 = create(:beer_rating, rate: 5, user: user_with_5_ratings)
    end

    context 'filters by any one rate' do
      it 'returns matched records' do
        expect(BeerRating.rated_at(3)).to contain_exactly(@rate_3)
      end
    end

    context 'filters by any range of rate' do
      it 'returns matched records ordered by ratings' do
        expect(BeerRating.rated_at(2..4)).to eq [@rate_4, @rate_3, @rate_2]
      end

      it 'returns matched records ordered by ratings' do
        expect(BeerRating.rated_at(2...4)).to eq [@rate_3, @rate_2]
      end
    end

  end
end
