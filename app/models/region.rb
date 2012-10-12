class Region < ActiveRecord::Base
  has_many :city
  
  attr_accessible :region_name, :as => :admin
end
