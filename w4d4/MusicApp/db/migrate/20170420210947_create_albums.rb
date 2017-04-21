class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :album_type, null: false
      t.index :band_id
      t.timestamps
    end
  end
end
