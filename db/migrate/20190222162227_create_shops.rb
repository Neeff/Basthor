class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      t.text :mision
      t.text :vision

      t.timestamps
    end
  end
end
