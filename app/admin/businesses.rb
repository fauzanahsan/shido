ActiveAdmin.register Business do
  menu :if => proc{ current_admin_user.has_role? ("Account Manager") }
  menu :if => proc{ current_admin_user.has_role? ("Admin") }
 
  controller.authorize_resource
  
  form do |f| 
    f.inputs do                        
      f.input :user_id, :as => :select,      :collection => Hash[User.all.map{|u| [u.email,u.id]}]   
      f.input :account_manager_id, :as => :select,      :collection => Hash[AdminUser.all.map{|a| [a.email,a.id]}]  
      f.input :company_name
      f.input :contact_person
      f.input :detail
      f.input :office_phone1, :label => "Office Phone 1" 
      f.input :office_phone2, :label => "Office Phone 2"
      f.input :mobile_phone1, :label => "Mobile Phone 1"
      f.input :mobile_phone2, :label => "Mobile Phone 2"
      f.input :region, :as => :select,    :collection => Hash[Region.all.map{|r| [r.region_name,r.region_name]}]
      f.input :city, :as => :select,      :collection => Hash[City.all.map{|c| [c.city_name,c.city_name]}]
      f.input :address
    
    end
    f.buttons                         
  end
end
