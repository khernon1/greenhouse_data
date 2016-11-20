byebug
# zip code file
i = 0
File.readlines('data/zipcode_region_ranges.txt').map do |content|
  content.split(/\r/).map do |line|
    if i != 0 
      new_line = line.split('<^>')
      Zipcode.create(region: new_line[0], min_zip_code: new_line[1], max_zip_code: new_line[2])      
    end  
    i += 1
  end
end

#registrant profile file
i = 0
File.readlines('data/registrant_profiles.txt').map do |content|
  content.split(/\r/).map do |line|    
    if i != 0 
      new_line = line.split('<^>')
      Profile.create(registrant_id: new_line[0], name: new_line[1], gender: new_line[2], breed: new_line[3], dob: Date.new(1899,12,30) + new_line[4].to_i.day, dominant_color: new_line[5], secondary_color: new_line[6], zip_code: new_line[7])
    end  
    i += 1
  end
end


#registrations file
i = 0
File.readlines('data/registrations.txt').map do |content|
  content.split(/\r/).map do |line|
    if i != 0 
      new_line = line.split('<^>')
      Registration.create(package: new_line[1], registration_date: Date.new(1899,12,30) + new_line[2].to_i.day, registrant_id: new_line[3])
    end  
    i += 1
  end
end