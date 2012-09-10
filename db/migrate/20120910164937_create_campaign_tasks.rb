class CreateCampaignTasks < ActiveRecord::Migration
  def change
    create_table :campaign_tasks do |t|
      t.string   :staff_id          , :default => '', :null => false
      t.string   :order_id          , :default => '', :null => false
      t.string   :task_name         , :default => '', :null => false
      t.column   :working_status    , "ENUM('new','in progress','draft','revision','completed','cancel')"
      t.column   :completed_date    , :datetime 
      
      t.timestamps
    end
    add_index :campaign_tasks, :order_id
    add_index :campaign_tasks, :staff_id
  end
  
  def down
    drop_table :campaign_tasks
  end

end
