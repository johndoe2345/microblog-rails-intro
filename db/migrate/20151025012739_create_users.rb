class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password
      t.string :username
      t.text :about_me

      t.timestamps null: false
    end
  end
end
