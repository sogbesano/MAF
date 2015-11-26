class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :surname
      t.string :username
      t.string :email
      t.string :email_confirmation
      t.string :password
      t.string :password_confirmation
      t.string :address

      t.timestamps null: false
    end
  end
end
