class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :token
      t.string :name
      t.string :username
      t.string :email
      t.string :password
      t.text :credly
      t.datetime :last_login
      t.text :remember_token
      t.integer :tos
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :verified_at
      t.integer :verified_by
      t.integer :default_group

      t.timestamps
    end
  end
end
