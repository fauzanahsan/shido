ActiveAdmin.register Business do
  #menu :if => proc{ current_admin_user.has_role? ("Account Manager") }
  #menu :if => proc{ can?(:manage, Business)  } 
  #controller.load_and_authorize_resource 
  #skip_load_resource :only => :index
  
  
end
