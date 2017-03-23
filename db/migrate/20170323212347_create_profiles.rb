class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.date :birth_date
      t.integer :ethnicity_id
      t.string :phone
      t.string :gender
      t.string :bio
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
