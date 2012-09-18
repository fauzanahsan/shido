ActiveAdmin.register Order do
  menu :if => proc{ current_admin_user.has_role? (:admin) } || proc{ current_admin_user.has_role? (:sales) } ||
              proc{ current_admin_user.has_role? (:account_manager) }
  controller.authorize_resource
  
  filter :user_email, :as => :string, :label => 'User Email'
  filter :sales_status, :as => :select, :collection => ["new","pending","paid","cancel","problem"]
  filter :order_date
  
end
