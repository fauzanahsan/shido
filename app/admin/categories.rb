ActiveAdmin.register Category do
  menu :parent => "Businesses", :if => proc{ current_admin_user.has_role? ("Account Manager") }
  menu :parent => "Businesses", :else => proc{ current_admin_user.has_role? ("Admin") }
  controller.authorize_resource
  
  filter :name, :label => "Category Name"
  
end
