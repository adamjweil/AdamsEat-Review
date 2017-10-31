class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name, NULL: false
      t.string :cuisine, NULL: false
      t.string :address, NULL: false
      t.string :city, NULL: false
      t.string :state, NULL: false
      t.integer :zip, NULL: false
      t.integer :user_id, foreign_key: true, NULL: false

      t.timestamps(NULL: false)
    end
  end
end
