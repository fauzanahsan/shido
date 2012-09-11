class Order < ActiveRecord::Base
  
  belongs_to :user, :dependent => :destroy
  has_one  :invoice
  has_many :web_package_order
  has_many :campaign_package_order
  
  attr_accessible :sales_id, :account_manager_id, :sales_status, :order_date, :fee
  
  
end
