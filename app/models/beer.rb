class Beer < ActiveRecord::Base
  validates_presence_of :name, :beer_type, :taste
  enum beer_type: [:weizen, :dunkel_weiss, :pilsner, :dunkel_lagger]
end
