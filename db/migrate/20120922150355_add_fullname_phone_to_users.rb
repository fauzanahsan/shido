class AddFullnamePhoneToUsers < ActiveRecord::Migration
  def up
    add_column :users, :fullname,  :string, :default => ""
    add_column :users, :phone,  :string, :default => ""
  end
  
  def down
    remove_column :users, :fullname
    remove_column :users, :phone
  end
end
