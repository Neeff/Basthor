class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 5, scale: 2
      t.text :description
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
