class AddWebInfoToBusiness < ActiveRecord::Migration
  def up
    add_column :businesses, :website,  :string, :default => ""
    add_column :businesses, :lat,      :string, :default => ""
    add_column :businesses, :long,     :string, :default => ""
  end
  
  def down
    remove_column :businesses, :website
    remove_column :businesses, :lat
    remove_column :businesses, :long
  end
end
