class CampaignTask < ActiveRecord::Base
  belongs_to :order
  
  attr_accessible :staff_id, :task_name, :working_status, :completed_date, :order_id, :title, 
                  :target_date, :as => :admin
                  
  after_create :set_working_status
  
  def set_working_status
    self.working_status = "new"
    save
  end
  
end
