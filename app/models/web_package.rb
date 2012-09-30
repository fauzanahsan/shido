class WebPackage < ActiveRecord::Base
  attr_accessible :package_name, :description, :fee #, :as => :admin
  has_many :web_package_orders
  has_many :orders, :through => :web_package_orders
end
