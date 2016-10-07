class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :album_id, null: false
      t.text :lyrics 
      t.boolean :bonus
      t.timestamps null: false
    end
  end
end
