ActiveAdmin.register AdminRole do
  menu :label => "Staff Roles", :parent => "Staff Management", :if => proc{ can?(:manage, AdminRole)  }
 
  controller.authorize_resource
  
  form do |f|                         
    f.inputs "Role Details" do
      f.input :name
    end
    f.buttons   
  end
                                      
end                                   
