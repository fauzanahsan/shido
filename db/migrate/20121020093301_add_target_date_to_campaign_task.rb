class AddTargetDateToCampaignTask < ActiveRecord::Migration
  def up
    add_column :campaign_tasks, :target_date,  :datetime
  end
  
  def down
    remove_column :campaign_tasks, :target_date
  end
end
