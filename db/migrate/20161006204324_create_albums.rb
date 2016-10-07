class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :band_id 
      t.boolean :live
      t.timestamps null: false
    end
  end
end
