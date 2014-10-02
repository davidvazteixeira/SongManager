class SongHistoriesController < ApplicationController

  def new
    @song_history = SongHistory.new
  end

  def create
    @song_history = SongHistory.create(create_params)
  end

  private

    def create_params
      params[:song_history].permit(:proto_name)
    end

end
