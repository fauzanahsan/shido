class CreateCampaignOrders < ActiveRecord::Migration
  def change
    create_table :campaign_orders do |t|

      t.timestamps
    end
  end
end
