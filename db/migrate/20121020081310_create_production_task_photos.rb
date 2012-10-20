class CreateProductionTaskPhotos < ActiveRecord::Migration
  def up
    create_table :production_task_photos do |t|
      t.integer :production_task_id
      t.string :name
      t.string :image
      t.timestamps
    end
  end
  
  def down
    drop_table :production_task_photos
  end
end
