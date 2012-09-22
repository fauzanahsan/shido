ActiveAdmin.register WebPackage do
  # menu :if => proc{ current_admin_user.has_role? (:admin) }
  menu :if => proc{ can?(:manage, WebPackage)  }
  controller.authorize_resource
end
