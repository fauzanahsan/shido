ActiveAdmin.register Order do
  controller.authorize_resource 
  #menu :if => proc{ current_admin_user.has_role? ("Account Manager")  }
  #menu :else => proc{ current_admin_user.has_role? ("Admin")  }
  
  filter :user_email, :as => :string, :label => 'User Email'
  #filter :user_fullname, :as => :string, :label => 'User Fullname'
  filter :sales_status, :as => :select, :collection => ["new","pending","paid","cancel","problem"]
  filter :order_date
  #filter :sales_id, :as => :select, :collection => AdminUser.all 
  filter :web_packages_package_name, :as => :select, :collection => WebPackage.all.collect {|w| [w.package_name, w.package_name]}
  filter :campaign_packages_package_name, :as => :select, :collection => CampaignPackage.all.collect {|c| [c.package_name, c.package_name]}
  
  index do
    column("Order ID", :id)
    column("User"){|order| order.user.email }
    column :sales_status
    column ("Sales") {|order| order.sales_id.blank? ? "" : AdminUser.find(order.sales_id).email }
    column ("Account Manager") {|order| order.account_manager_id.blank? ? "" : AdminUser.find(order.account_manager_id).email }
    column("Fee")  {|order| number_to_currency order.fee }
    column :created_at
    column :updated_at
    default_actions
  end
  
  show do |order|
    attributes_table do
      row :id
      row :sales_status
      row :user do
        order.user.email
      end
      
      row :sales do
        order.sales_id.blank? ? "" : AdminUser.find(order.sales_id).email 
      end
      
      row :account_manager do
        order.account_manager_id.blank? ? "" : AdminUser.find(order.account_manager_id).email
      end
      
      row :web_package do
        order.web_packages.blank? ? "" : order.web_packages.all.collect {|w| w.package_name}
      end
      
      row :campaign_package do
        order.campaign_packages.blank? ? "" : order.campaign_packages.all.collect {|w| w.package_name}
      end
      
      row :fee do
        number_to_currency order.fee
      end
      
      row :created_at
      row :updated_at
      
    end
    active_admin_comments
  end
  
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
