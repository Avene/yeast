class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :beer_type
      t.string :taste

      t.timestamps
    end
  end
end
