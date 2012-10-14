class Business < ActiveRecord::Base
  acts_as_gmappable
  
  belongs_to :user
  
  has_many :business_categories
  has_many :categories, :through => :business_categories
  has_many :business_photos
  
  attr_accessible :company_name, :contact_person, :detail, :office_phone1, :office_phone2, :mobile_phone1, :mobile_phone2,
                  :region, :city, :address, :biz_name, :products_services, :user_id, :account_manager_id, :latitude, :longitude,
                  :category_ids, :as => :admin
  
  attr_accessible :company_name, :contact_person, :detail, :office_phone1, :office_phone2, :mobile_phone1, :mobile_phone2,
                  :region, :city, :address, :biz_name, :products_services, :user_id, :account_manager_id, :latitude, :longitude,
                  :category_ids, :as => :admin

  after_create :set_account_manager                

  def gmaps4rails_address
    "#{self.address}, #{self.city}, #{self.region}" 
    #address
  end
  
  def own_business?(user_id)
    self.user_id == user_id
  end
  
  def manage_business?(account_manager_id)
    self.account_manager_id == account_manager_id
  end
  
  def set_account_manager
    self.account_manager_id = self.user.account_manager_id
    save
  end
  
                  
end
