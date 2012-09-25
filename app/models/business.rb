class Business < ActiveRecord::Base
  acts_as_gmappable
  
  belongs_to :user
  
  has_many :business_categories
  has_many :categories, :through => :business_categories
  has_many :business_photos
  
  attr_accessible :company_name, :contact_person, :detail, :office_phone1, :office_phone2, :mobile_phone1, :mobile_phone2,
                  :region, :city, :address, :biz_name, :products_services, :user_id, :account_manager_id, :latitude, :longitude  


  def gmaps4rails_address
    "#{self.address}, #{self.city}, #{self.region}" 
    #address
  end
  
                  
end
