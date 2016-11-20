class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :registrant_id
      t.string :name
      t.string :gender
      t.string :breed
      t.date :dob
      t.string :dominant_color
      t.string :secondary_color
      t.string :zip_code

      t.timestamps
    end
  end
end
