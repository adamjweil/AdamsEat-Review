class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, NULL: false
      t.string :email, NULL: false
      t.string :password_digest, NULL: false

      t.timestamps(NULL: false)
    end
  end
end
