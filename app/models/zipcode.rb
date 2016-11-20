class Zipcode < ApplicationRecord

  def get_zipcodes
    sql = <<-SQL
      SELECT COUNT (DISTINCT region) FROM zipcodes
    SQL
    ActiveRecord::Base.connection.execute(sql)
  end
end

