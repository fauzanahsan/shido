ActiveAdmin.register Order do
  controller.authorize_resource
  
  filter :user_email, :as => :string, :label => 'User Email'
  filter :sales_status, :as => :select, :collection => ["new","pending","paid","cancel","problem"]
  filter :order_date
  
end
