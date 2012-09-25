class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer   :sales_id          , :default => nil
      t.integer   :user_id           , :null => false
      t.integer   :order_id          , :null => false
      
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
