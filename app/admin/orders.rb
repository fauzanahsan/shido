ActiveAdmin.register Order do
  controller.authorize_resource 
  #menu :if => proc{ current_admin_user.has_role? ("Account Manager")  }
  #menu :else => proc{ current_admin_user.has_role? ("Admin")  }
  
  filter :user_email, :as => :string, :label => 'User Email'
  filter :sales_status, :as => :select, :collection => ["new","pending","paid","cancel","problem"]
  filter :order_date
  
  
  
  form do |f|                         
    f.inputs "Order Details" do
      if f.object.new_record?
        f.input :user_id, :as => :select,      :collection => Hash[User.all.map{|u| [u.email,u.id]}]
      end   
      f.input :sales_id, :as => :select,      :collection => Hash[AdminUser.with_role("Sales").all.map{|a| [a.email,a.id]}]  
      #f.input :sales_id, :as => :autocomplete, :url => autocomplete_admin_user_email_admin_admin_users_path
      f.input :account_manager_id, :as => :select,      :collection => Hash[AdminUser.with_role("Account Manager").all.map{|a| [a.email,a.id]}]       
      f.input :sales_status, :as => :select,  :collection => ["new", "paid", "pending", "cancel", "problem"]               
      f.input :order_date, :as => :date_select
      f.input :fee
      f.input :campaign_packages, :label => "Campaign Package", :as => :select, :collection => Hash[CampaignPackage.all.map{|u| [u.package_name,u.id]}]
      f.input :web_packages, :label => "Web Package", :as => :select, :collection => Hash[WebPackage.all.map{|u| [u.package_name,u.id]}]   
    end                               
    f.buttons                         
  end
  
end
