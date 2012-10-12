ActiveAdmin.register AdminRole do
  menu :label => "Staff Roles", :parent => "Staff Management", :if => proc{ can?(:manage, AdminRole)  }
 
  controller.authorize_resource
                                      
end                                   
