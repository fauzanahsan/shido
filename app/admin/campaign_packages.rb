ActiveAdmin.register CampaignPackage do
  menu :parent => "Campaign", :if => proc { can?(:manage, CampaignPackage) } 
  controller.authorize_resource
  
end
