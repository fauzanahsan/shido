class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string   :region_id        , :default => '', :null => false
      t.string   :city_name        , :default => '', :null => false
            
      t.timestamps
    end
  end
  
  def down
    drop_table :cities
  end
end
