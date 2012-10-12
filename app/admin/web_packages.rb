ActiveAdmin.register WebPackage do
  menu :parent => "Production", :if => proc{ can?(:manage, WebPackage) } 
  controller.authorize_resource
  
end
