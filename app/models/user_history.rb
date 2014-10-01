class UserHistory < ActiveRecord::Base
  belongs_to :user
  belongs_to :song_history
end
