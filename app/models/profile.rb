class Profile < ApplicationRecord

  def get_gold_levels
    sql = <<-SQL
      SELECT DISTINCT registrations.registrant_id
        FROM registrations
        JOIN profiles
        ON registrations.registrant_id = profiles.registrant_id
        WHERE UPPER(profiles.dominant_color) = UPPER('gold') 
        AND registrations.registration_date  >= date('now', '-4 months')
    SQL
    run = ActiveRecord::Base.connection.execute(sql)
    run.each do |id|
      puts id[0]
    end
  end

  def get_mixed_breed_by_region
    # the amount of animals in each region
    # the amount of mixed breed in each region
    sql = <<-SQL
      SELECT zipcodes.region, COUNT(zipcodes.region) as total_count
        FROM profiles
        JOIN zipcodes
        ON profiles.zip_code BETWEEN zipcodes.min_zip_code AND zipcodes.max_zip_code
        GROUP BY zipcodes.region
    SQL

    run_all = ActiveRecord::Base.connection.execute(sql)
    
    sql = <<-SQL
      SELECT zipcodes.region, COUNT(zipcodes.region) as mixed_count
        FROM profiles
        JOIN zipcodes
        ON profiles.zip_code BETWEEN zipcodes.min_zip_code AND zipcodes.max_zip_code
        WHERE UPPER(profiles.breed) = UPPER('Mixed/Other')
        GROUP BY zipcodes.region
        ORDER BY COUNT(zipcodes.region)
    SQL
    
    run_mixed = ActiveRecord::Base.connection.execute(sql)

    all_percentages = {}
    run_all.each do |region|
      mixed_amount = run_mixed.find {|x| x['region'] == region['region']}
      percentage = (mixed_amount['mixed_count']/region['total_count'].to_f * 100).round(2)
      all_percentages[region['region']] = percentage
    end
    byebug
    print all_percentages
  end

end