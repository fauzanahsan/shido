ActiveAdmin.register User do
  menu :if => proc{ current_admin_user.has_role? (:admin) } ||
              proc{ current_admin_user.has_role? (:account_manager) }
  controller.authorize_resource
  
end
