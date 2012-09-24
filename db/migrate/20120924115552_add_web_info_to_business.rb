class AddWebInfoToBusiness < ActiveRecord::Migration
  def up
    add_column :businesses, :website,  :string, :default => ""
    add_column :businesses, :latitude,  :float
    add_column :businesses, :longitude, :float
    add_column :businesses, :gmaps, :boolean
  end
  
  def down
    remove_column :businesses, :website
    remove_column :businesses, :latitude
    remove_column :businesses, :longitude
    remove_column :businesses, :gmaps
  end
end
