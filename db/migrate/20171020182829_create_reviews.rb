class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :restaurant_id, foreign_key: true
      t.integer :user_id, foreign_key: true, NULL: false
      t.integer :numerical_review, null: false
      t.string :content

      t.timestamps(NULL: false)
    end
  end
end
