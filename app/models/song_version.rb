class SongVersion < ActiveRecord::Base
  belongs_to :song_history
end
