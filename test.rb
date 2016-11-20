require 'byebug'
  def get_gold_levels
    sql = <<-SQL
      SELECT DISTINCT registrations.registrant_id
        FROM registrations
        JOIN profiles
        ON registrations.registrant_id = profiles.registrant_id
        WHERE registrations.registration_date  >= date('now', '-4 months')
        AND UPPER(profiles.dominant_color) = UPPER('gold') 
    SQL
    run = ActiveRecord::Base.connection.execute(sql)
    run.each do |id|
      print id
    end
  end

get_gold_levels