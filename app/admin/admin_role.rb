ActiveAdmin.register AdminRole do
  menu :label => "Staff Roles", :parent => "Staff Management", :if => proc{ current_admin_user.has_role? ("Admin") }
 
  controller.authorize_resource
                                      
end                                   
