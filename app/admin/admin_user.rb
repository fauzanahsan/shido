ActiveAdmin.register AdminUser do
  menu :label => "Staff"
  menu :if => proc{ current_admin_user.has_role? (:admin) }
  controller.authorize_resource
       
  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.buttons                         
  end                                 
end                                   
