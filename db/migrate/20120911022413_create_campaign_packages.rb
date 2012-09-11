class CreateCampaignPackages < ActiveRecord::Migration
  def self.up
    create_table :campaign_packages do |t|
      t.string   :package_name      , :default => '', :null => false
      t.string   :description      
      t.column   :fee               , :bigint, :default => 0
            
      t.timestamps
    end
  end
  
  def self.down
    drop_table :campaign_packages
  end
end
