require 'byebug'
def reading
  File.readlines('data/zipcode_region_ranges.txt').map do |content|    
    content.split(/\r/).map do |line|
      byebug
    end
  end
end

reading