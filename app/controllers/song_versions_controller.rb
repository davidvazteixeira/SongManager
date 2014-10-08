class SongVersionsController < ApplicationController
  def index
    @song_versions = song_history.song_versions
  end

  def new
    @song_history = SongHistory.find(params[:song_history_id])
    @song_version = SongVersion.new
  end

  def create
    @song_version = SongVersion.create(create_params)
    redirect_to song_history_song_versions_path
  end

  def show
    @song_version = SongVersion.find(params[:id])
  end

  private
    def create_params
      params.permit(:song_history_id, :song_version)
    end

    def song_history
      @song_history ||= SongHistory.find(params[:song_history_id])
    end
end
