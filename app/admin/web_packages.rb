ActiveAdmin.register WebPackage do
  menu :if => proc{ current_admin_user.has_role?("Admin") } 
  controller.authorize_resource
  
end
