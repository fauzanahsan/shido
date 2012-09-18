ActiveAdmin.register WebPackage do
  menu :if => proc{ current_admin_user.has_role? (:admin) }
  controller.authorize_resource
end
