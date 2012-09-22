ActiveAdmin.register User do
  menu :if => proc{ 
                    proc { current_admin_user.has_role?("Admin") } 
                  }
  controller.authorize_resource
  
  filter :email
  filter :created_at
  
  index do
    column :id
    column :email
    column :sign_in_count
    column :current_sign_in_at
    column :current_sign_in_ip
    column :created_at
    default_actions
  end
  
  form do |f|                         
    f.inputs "Users Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation
    end                               
    f.buttons                         
  end
  
end
