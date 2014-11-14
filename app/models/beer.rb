class Beer < ActiveRecord::Base
  enum beer_type: [:weizen, :dunkel_weiss, :pilsner, :dunkel_lagger]

  validates_presence_of :name, :beer_type, :taste

  has_many :beer_ratings

  scope :rated_than,
        lambda{ |rate|
          where(:id => BeerRating.select(:beer_id).having('avg(rate) >= ?', rate).group(:beer_id))
        }

  # returns rating average, half up 3rd places of decimals
  def average_rating
    return beer_ratings.average(:rate).round(2, :half_up)
  end
end
