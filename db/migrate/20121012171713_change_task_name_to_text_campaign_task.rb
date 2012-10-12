class ChangeTaskNameToTextCampaignTask < ActiveRecord::Migration
  def up
    remove_column :campaign_tasks, :task_name
    add_column :campaign_tasks, :task_name,  :text, :default => "", :null => false
  end

  def down
    remove_column :campaign_tasks, :task_name
    add_column :campaign_tasks, :task_name,  :string, :default => "", :null => false
  end
end
