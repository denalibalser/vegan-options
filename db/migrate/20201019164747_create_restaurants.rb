class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.strring :address
      t.string :phone_number
      t.integer :vegan_friendliness_rating
      t.integer :price_rating
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :state, null: false, foreign_key: true

      t.timestamps
    end
  end
end
