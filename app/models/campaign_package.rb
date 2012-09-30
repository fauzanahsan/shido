class CampaignPackage < ActiveRecord::Base
  attr_accessible :package_name, :description, :fee
  has_many :campaign_package_orders
  has_many :orders, :through => :campaign_package_orders
end
