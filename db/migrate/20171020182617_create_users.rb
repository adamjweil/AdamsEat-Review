class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, NULL: false
      t.string :email, index: true, NULL: false
      t.boolean :admin, default: false
      t.string :password_digest
      t.string :remember_digest
      t.string :access_token, index: true, unique: true

      t.timestamps(NULL: false)
    end
  end
end
