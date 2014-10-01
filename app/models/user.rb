class User < ActiveRecord::Base
  has_many :user_histories
  has_many :song_histories, :through => :user_histories
end
