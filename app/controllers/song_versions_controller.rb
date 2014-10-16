class SongVersionsController < ApplicationController

  respond_to :html

  def new
    respond_with @song_version = song_versions.new
  end

  def create
    respond_with song_versions.create(permited_params), location: [song_history]
  end

  def show
    respond_with song_version
  end

  def edit
    respond_with song_version
  end

  def update
    respond_with song_history, song_versions.update(params[:id], permited_params)
  end

  def destroy
    respond_with song_version.destroy, location: [@song_history]
  end

  private
    def permited_params
      params[:song_version].permit(:name)
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
