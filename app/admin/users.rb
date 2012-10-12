ActiveAdmin.register User do
  menu :label => "Clients", :if => proc { can?(:manage, User)  }
  controller.authorize_resource
  
  filter :email
  filter :created_at
  
  index do
    column :email
    column :fullname
    column :phone
    column :sign_in_count
    column :current_sign_in_at
    column :current_sign_in_ip
    column :created_at
    column("Action") { |user| 
                        button_to('Sign in', signin_as_admin_user_path(user.id, :protocol => "https"), :method => :put) 
                     }
    default_actions
  end
  
  form do |f|                         
    f.inputs "Users Details" do       
      f.input :email
      f.input :fullname
      f.input :phone               
      f.input :password               
      f.input :password_confirmation
    end                               
    f.buttons                         
  end
  
  member_action :signin_as, :method => :put do
    sign_in(:user, User.find(params[:id]), :bypass => true)
    redirect_to root_url
  end
end
