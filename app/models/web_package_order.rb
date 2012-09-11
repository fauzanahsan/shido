class WebPackageOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :web_package
  # attr_accessible :title, :body
end
