class AddAccountManagerToUser < ActiveRecord::Migration
  def up
    add_column :users, :account_manager_id,  :integer
  end
  
  def down
    remove_column :users, :account_manager_id
  end
end
