class CreateCampaignTasks < ActiveRecord::Migration
  def change
    create_table :campaign_tasks do |t|

      t.timestamps
    end
  end
end
