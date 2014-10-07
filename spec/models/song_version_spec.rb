require 'rails_helper'

RSpec.describe SongVersion, :type => :model do

  it { should belong_to(:song_history) }
end
