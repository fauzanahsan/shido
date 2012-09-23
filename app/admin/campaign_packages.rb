ActiveAdmin.register CampaignPackage do
  menu :parent => "Campaign", :if => proc { current_admin_user.has_role?("Admin") } 
  controller.authorize_resource
  
end
