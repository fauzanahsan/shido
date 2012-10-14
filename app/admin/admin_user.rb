ActiveAdmin.register AdminUser do
  menu :label => "Staffs",:parent => "Staff Management", :if => proc{ can?(:manage, AdminUser) }
 
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
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
        f.input :roles, :as => :radio, :collection => AdminRole.all
      else
        f.input :roles, :as => :select, :collection => AdminRole.all
      end  
    end                               
    f.buttons                         
  end 
  
  controller do
    autocomplete :admin_user, :email #, :full => true
  end
                                  
end                                   
