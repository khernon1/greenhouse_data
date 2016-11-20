class CreateZipcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :zipcodes do |t|
      t.string :region
      t.integer :min_zip_code
      t.integer :max_zip_code

      t.timestamps
    end
  end
end
