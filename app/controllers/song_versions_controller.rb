class SongVersionsController < ApplicationController

  respond_to :html

  def new
    respond_with @song_version = song_versions.new
  end

  def create
    respond_with song_versions.create(create_params), location: [song_history]
  end

  def show
    respond_with song_version
  end

  def edit
    respond_with song_version
  end

  def update
    @song_version = SongVersion.find(params[:id])
    @song_version.name = params[:song_version][:name]
    @song_version.song_history_id = params[:song_history_id]
    @song_version.save

    redirect_to song_history_song_version_path(params[:song_history_id], params[:id])
  end

  private
    def create_params
      params[:song_version].permit(:name)
    end

    def update_params
      params.permit(:song_history_id, :song_version)
    end

    def song_history
      @song_history ||= SongHistory.find(params[:song_history_id])
    end

    def song_version
      @song_version ||= song_history.song_versions.find(params[:id])
    end

    def song_versions
      song_history.song_versions
    end

end
