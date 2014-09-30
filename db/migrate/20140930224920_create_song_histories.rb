class CreateSongHistories < ActiveRecord::Migration
  def change
    create_table :song_histories do |t|
      t.string :proto_name

      t.timestamps
    end
  end
end
