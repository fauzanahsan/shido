ActiveAdmin.register Region do
  menu :parent => "Location", :if => proc { can?(:manage, Region) } 
  controller.authorize_resource
  
end
