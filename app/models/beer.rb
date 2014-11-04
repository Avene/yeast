class Beer < ActiveRecord::Base
  enum kind: [:weizen, :dunkel, :pilsner]
end
