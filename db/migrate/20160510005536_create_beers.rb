class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.string :alcohol
      t.string :image_url

      t.timestamps null: false
    end
  end
end
