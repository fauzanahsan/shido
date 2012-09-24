class CreateBusinessPhotos < ActiveRecord::Migration
  def up
    create_table :business_photos do |t|
      t.integer :business_id
      t.string :name
      t.string :image
      t.timestamps
    end
  end
  
  def down
    drop_table :business_photos
  end
end
