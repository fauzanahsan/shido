ActiveAdmin.register ProductionTask do
  # menu :if => proc{ current_admin_user.has_role? (:admin) } ||
  #               proc{ current_admin_user.has_role? (:account_manager) }
  #menu :if => proc{ can?(:manage, ProductionTask)  }
  menu :if => proc{ current_admin_user.has_role? ("Account Manager") } 
  menu :else => proc{ current_admin_user.has_role? ("Admin") } 
                       
  controller.authorize_resource
  
  filter :task_name
  filter :working_status, :as => :select, :collection => ["new","in progress","draft","revision","completed","cancel"]
  filter :completed_date
end
