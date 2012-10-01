ActiveAdmin.register Business do
  menu :if => proc{ current_admin_user.has_role? ("Account Manager") }
  menu :else => proc{ current_admin_user.has_role? ("Admin") }
 
  controller.authorize_resource
  
  filter :user, :as => :select, :collection => Hash[User.all.map{|u| [u.email,u.id]}]   
  filter :company_name
  filter :biz_name, :label => 'Business Name'
  filter :contact_person
  filter :detail
  filter :products_services
  filter :office_phone1
  filter :office_phone2
  filter :mobile_phone1
  filter :mobile_phone2
  filter :region
  filter :city
  
  
  index do
    column :company_name
    column("Business Name", :biz_name)
    column("User") { |business| business.user.email }
    column :office_phone1
    column :mobile_phone1
    column :contact_person
    column :city
    column :created_at
    default_actions
  end
  
  form do |f| 
    f.inputs do                        
      f.input :user_id, :as => :select,      :collection => Hash[User.all.map{|u| [u.email,u.id]}]   
      f.input :account_manager_id, :as => :select,      :collection => Hash[AdminUser.with_role("Account Manager").all.map{|a| [a.email,a.id]}]   
      f.input :company_name
      f.input :biz_name, :label => "Business Name (Identifier)"
      if f.object.new_record?
        f.input :categories, :label => "Business Categories", :as => :check_boxes, :collection => Hash[Category.all.map{|u| [u.name,u.id]}]  
      else
        f.input :categories, :label => "Business Categories", :as => :select, :collection => Hash[Category.all.map{|u| [u.name,u.id]}]  
      end
      f.input :contact_person
      f.input :detail, :label => "Business Description"
      f.input :products_services, :label => "Products & Services"
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
