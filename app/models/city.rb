class City < ActiveRecord::Base
  belongs_to :region
  
  attr_accessible :city_name, :region_id
end
