class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.string :package
      t.date :registration_date
      t.integer :registrant_id

      t.timestamps
    end
  end
end
