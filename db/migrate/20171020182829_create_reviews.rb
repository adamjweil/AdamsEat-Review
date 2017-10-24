class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :restaurant_id, foreign_key: true
      t.references :user
      t.integer :numerical_review, null: false
      t.string :content

      t.timestamps(NULL: false)
    end
  end
end
