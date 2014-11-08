class CreateBeerRatings < ActiveRecord::Migration
  def change
    create_table :beer_ratings do |t|
      t.references :beer, index: true
      t.references :user, index: true
      t.integer :rate
      t.string :review

      t.timestamps
    end
  end
end
