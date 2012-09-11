class CampaignPackageOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :campaign_package
  # attr_accessible :title, :body
end
