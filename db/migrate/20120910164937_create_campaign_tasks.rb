class CreateCampaignTasks < ActiveRecord::Migration
  def self.up
    create_table :campaign_tasks do |t|
      t.integer   :staff_id          , :default => nil
      t.integer   :order_id          , :null => false
      t.string   :task_name         , :default => '', :null => false
      # "ENUM('new','in progress','draft','revision','completed','cancel')"
      t.string   :working_status    , :default => '', :null => false 
      t.column   :completed_date    , :datetime 
      
      t.timestamps
    end
    add_index :campaign_tasks, :order_id
    add_index :campaign_tasks, :staff_id
  end
  
  def self.down
    drop_table :campaign_tasks
  end

end
