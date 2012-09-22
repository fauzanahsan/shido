ActiveAdmin.register CampaignPackage do
  #menu :if => proc{ current_admin_user.has_role? (:admin) }
  menu :if => proc{ can?(:manage, CampaignPackage)  }
  controller.authorize_resource
  
end
