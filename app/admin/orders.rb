ActiveAdmin.register Order do
  controller.authorize_resource 
  #menu :if => proc{ can?(:manage, Order)  }
  #menu :if => proc{ current_admin_user.has_role? ("Account Manager")  }
  
  filter :user_email, :as => :string, :label => 'User Email'
  filter :sales_status, :as => :select, :collection => ["new","pending","paid","cancel","problem"]
  filter :order_date
  
  form do |f|                         
    f.inputs "Order Details" do
      f.input :user_id, :as => :select,      :collection => Hash[User.all.map{|u| [u.email,u.id]}]   
      #f.input :sales_id, :as => :select,      :collection => Hash[AdminUser.all.map{|a| [a.email,a.id]}]  
      f.input :sales_id, :as => :autocomplete, :url => autocomplete_admin_user_email_admin_admin_users_path
      f.input :account_manager_id, :as => :select,      :collection => Hash[AdminUser.all.map{|a| [a.email,a.id]}]       
      #f.input :user,  :as => :select,  :collection => User.all                  
      f.input :sales_status, :as => :select,  :collection => ["new", "paid", "pending", "cancel", "problem"]               
      f.input :order_date, :as => :date_select
      f.input :fee
    end                               
    f.buttons                         
  end
  
end
