class CreateCampaignPackageOrders < ActiveRecord::Migration
  def self.up
    create_table :campaign_package_orders do |t|
      t.references :order
      t.references :campaign_package
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :campaign_package_orders
  end
end
