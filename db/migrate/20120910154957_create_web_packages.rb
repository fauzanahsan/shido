class CreateWebPackages < ActiveRecord::Migration
  def change
    create_table :web_packages do |t|

      t.timestamps
    end
  end
end
