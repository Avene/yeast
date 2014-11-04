class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :kind
      t.integer :taste

      t.timestamps
    end
  end
end
