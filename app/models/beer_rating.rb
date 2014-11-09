class BeerRating < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user

  validates_presence_of :beer, :user, :rate
  validates_numericality_of :rate,
                            { :greater_than_or_equal_to => 1,
                              :less_than_or_equal_to => 5 }
  # validates_associated :beer, :user
end
