class Business < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :company_name, :contact_person, :detail, :office_phone1, :office_phone2, :mobile_phone1, :mobile_phone2,
                  :region, :city, :address  
end
