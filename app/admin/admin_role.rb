ActiveAdmin.register AdminRole do
  menu :label => "Staff Roles", :if => proc{ current_admin_user.has_role? ("Admin") }
 
  controller.authorize_resource
                                      
end                                   
