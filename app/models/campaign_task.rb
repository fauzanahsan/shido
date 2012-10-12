class CampaignTask < ActiveRecord::Base
  belongs_to :order
  
  attr_accessible :staff_id, :task_name, :working_status, :completed_date, :order_id, :as => :admin
end
