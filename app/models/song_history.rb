class SongHistory < ActiveRecord::Base
  has_many :song_versions, :dependent => :delete_all
end
