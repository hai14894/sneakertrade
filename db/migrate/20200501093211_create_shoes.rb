class CreateShoes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes do |t|
      t.string :brand
      t.string :model
      t.integer :condition
      t.integer :price
      t.text :description
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
