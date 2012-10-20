class AddTitleToCampaignTask < ActiveRecord::Migration
  def up
    add_column :campaign_tasks, :title,  :string, :default => ""
  end
  
  def down
    remove_column :campaign_tasks, :title
  end
end
