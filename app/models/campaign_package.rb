class CampaignPackage < ActiveRecord::Base
  attr_accessible :package_name, :description, :fee, :as => :admin
  has_many :campaign_package_orders
  has_many :orders, :through => :campaign_package_orders
end
