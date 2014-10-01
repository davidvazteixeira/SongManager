require 'rails_helper'

describe UserHistory, :type => :model do
  it { should belong_to(:user) }
  it { should belong_to(:song_history) }
end
