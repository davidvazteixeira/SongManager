require 'rails_helper'

describe SongHistory, :type => :model do

  it {should have_many(:song_versions)}

end
