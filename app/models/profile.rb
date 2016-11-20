class Profile < ApplicationRecord

 # Next, the team is looking to kick off a campaign promoting the 
 # newly reduced rate for their Gold-level course package. 
 # They want to reach out to the owners of all recent students 
 # with gold coats to see if they'd be interested in being featured
 # in the campaign.

# Please use the information in the exports to create a list of all 
# of the students registered in the past four months with gold coats. 
# They just need to know the students' unique ID numbers so they can 
# look up their contact info in the system. 
# You can attach the list in any format.

  def get_unique_profile_count    
  end

  def get_gold_level
    sql = <<-SQL
      SELECT profiles.registrant_id
        FROM profiles
        WHERE UPPER(profiles.dominant_color) = UPPER('gold')    
      SQL
    ActiveRecord::Base.connection.execute(sql)
  end

sql = <<-SQL
  SELECT COUNT(registrations.registrant_id)
    FROM registrations
    WHERE registrations.registration_date >= ('2016-10-29' - 120)
SQL

sql = <<-SQL
  SELECT COUNT(registrations.registrant_id)
    FROM registrations
    WHERE registrations.registration_date >= (SELECT registrations.registration_date
    FROM registrations
    GROUP BY id
    ORDER BY registration_date DESC LIMIT 1)
SQL


query to get the latest date  
  sql = <<-SQL
    SELECT registrations.registration_date
    FROM registrations
    GROUP BY id
    ORDER BY registration_date DESC LIMIT 1
  SQL
end
