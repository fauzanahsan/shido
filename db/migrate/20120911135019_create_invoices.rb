class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.string   :sales_id          , :default => '', :null => false
      t.string   :user_id           , :default => '', :null => false
      t.string   :order_id          , :default => '', :null => false
      
      t.column   :order_date        , :datetime 
      t.column   :fee               , :bigint, :default => 0
      
      t.timestamps
    end
    
    add_index :invoices, :sales_id
    add_index :invoices, :user_id
    add_index :invoices, :order_id
  end
  
  def self.down
    drop_table :invoices
  end
end
