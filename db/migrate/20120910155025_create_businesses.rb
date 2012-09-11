class CreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses do |t|
      t.string   :user_id             , :default => '', :null => false
      t.string   :account_manager_id  , :default => '', :null => false
      t.string   :company_name        , :default => '', :null => false
      t.string   :contact_person      , :default => ''
      t.text     :detail              , :default => ''
      t.string   :office_phone1       , :default => ''
      t.string   :office_phone2       , :default => ''
      t.string   :mobile_phone1       , :default => ''
      t.string   :mobile_phone2       , :default => ''
      t.string   :region_id
      t.string   :city_id
      t.text     :address
      
      t.timestamps
    end
    add_index :businesses, :user_id
    add_index :businesses, :account_manager_id
  end
  
  def self.down
    drop_table :businesses
  end
end
