class SongHistory < ActiveRecord::Base
  has_many :song_versions
end
