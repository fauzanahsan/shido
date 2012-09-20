class WebPackage < ActiveRecord::Base
  attr_accessible :package_name, :description, :fee #, :as => :admin
end
