class Order < ActiveRecord::Base
  
  belongs_to :user, :dependent => :destroy
  has_one  :invoice
  has_many :web_package_orders
  has_many :web_packages, :through => :web_package_orders
  has_many :campaign_package_orders
  has_many :campaign_packages, :through => :campaign_package_orders
  has_many :production_tasks
  has_many :campaign_tasks
  
  attr_accessible :user_id, :sales_id, :account_manager_id, :sales_status, :order_date, :fee, :campaign_package_ids, 
                  :web_package_ids #, :as => :admin
  
  
end
