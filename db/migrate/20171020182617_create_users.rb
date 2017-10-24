class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, index: true, unique: true
      t.boolean :admin, default: false
      t.string :password_digest
      t.string :remember_digest

      t.timestamps(NULL: false)
    end
  end
end
