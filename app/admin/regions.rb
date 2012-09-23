ActiveAdmin.register Region do
  menu :parent => "Location", :if => proc { current_admin_user.has_role?("Admin") } 
  controller.authorize_resource
  
end
