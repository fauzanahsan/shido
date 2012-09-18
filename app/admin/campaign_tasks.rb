ActiveAdmin.register CampaignTask do
  menu :if => proc{ current_admin_user.has_role? (:admin) } ||
              proc{ current_admin_user.has_role? (:account_manager) }
  controller.authorize_resource
  
  filter :task_name
  filter :working_status, :as => :select, :collection => ["new","in progress","draft","revision","completed","cancel"]
  filter :completed_date
  
end
