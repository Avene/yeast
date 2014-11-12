class Beer < ActiveRecord::Base
  enum beer_type: [:weizen, :dunkel_weiss, :pilsner, :dunkel_lagger]

  validates_presence_of :name, :beer_type, :taste

  has_many :beer_ratings

  # returns rating average, half up 3rd places of decimals
  def average_rating()
    return beer_ratings.average(:rate).round(2, :half_up)
  end
end
