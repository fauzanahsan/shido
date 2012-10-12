class CampaignPackageOrder < ActiveRecord::Base
  attr_accessible :order_id, :campaign_package_id, :as => :admin
  belongs_to :order
  belongs_to :campaign_package
  # attr_accessible :title, :body
end
