class Invoice < ActiveRecord::Base
  belongs_to :order
  
  attr_accessible :sales_id, :user_id, :order_id, :order_date, :fee, :as => :admin
end
