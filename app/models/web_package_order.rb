class WebPackageOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :web_package
  attr_accessible :order_id, :web_package_id
end
