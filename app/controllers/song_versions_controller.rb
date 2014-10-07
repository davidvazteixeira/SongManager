class SongVersionsController < ApplicationController
  def index
    #@song_versions = SongVersion.find_by
  end

  def new
    @song_history = SongHistory.find(params[:song_history_id])
    @song_version = SongVersion.new
  end

  def create
    #@song_version = SongVersion.create(create_params)
    @song_version = SongVersion.new
    @song_version.name = params[:song_version][:name]
    @song_version.song_history_id = params[:song_history_id]
    @song_version.save
  end

  private
    def create_params
      params[:song_version].permit(:name, :song_history_id)
    end
end
