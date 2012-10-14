class Order < ActiveRecord::Base
  
  belongs_to :user
  has_one  :invoice
  has_many :web_package_orders
  has_many :web_packages, :through => :web_package_orders
  has_many :campaign_package_orders
  has_many :campaign_packages, :through => :campaign_package_orders
  has_many :production_tasks
  has_many :campaign_tasks
  
  attr_accessible :user_id, :sales_id, :account_manager_id, :sales_status, :order_date, :fee, :campaign_package_ids, 
                  :web_package_ids, :notes, :as => :admin
  
  
  after_create :set_order_info
  
  def set_order_info
    self.sales_status = "new"
    self.fee = self.campaign_packages.sum('fee') + self.web_packages.sum('fee') 
    self.account_manager_id = self.user.account_manager_id
    save
  end
  
end
