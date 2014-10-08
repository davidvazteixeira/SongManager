class SongHistoriesController < ApplicationController

  def index
    @song_histories = SongHistory.all
  end

  def new
    @song_history = SongHistory.new
  end

  def create
    @song_history = SongHistory.create(create_params)
    redirect_to song_histories_path
  end

  def edit
    song_history
  end

  def update
    @song_history = SongHistory.update(params[:id], update_params)
    redirect_to song_histories_path
  end

  def destroy
    @song_history = SongHistory.destroy(params[:id])
    redirect_to song_histories_path
  end

  def show
    @song_history = SongHistory.find(params[:id])
    @song_versions = @song_history.song_versions
  end

  private

    def song_history
      @song_history ||= SongHistory.find(params[:id])
    end

    def create_params
      params[:song_history].permit(:proto_name)
    end

    def update_params
      params[:song_history].permit(:proto_name)
    end

end
