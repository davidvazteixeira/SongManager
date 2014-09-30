class CreateSongVersions < ActiveRecord::Migration
  def change
    create_table :song_versions do |t|
      t.references :song_history
      t.string :name
      t.string :song

      t.timestamps
    end
  end
end
