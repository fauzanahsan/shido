class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string   :region_name        , :default => '', :null => false
      
      t.timestamps
    end
  end
  
  def down
    drop_table :regions
  end
end
