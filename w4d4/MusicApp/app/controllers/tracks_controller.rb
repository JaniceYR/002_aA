class TracksController < ApplicationController

  def new

  end


  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      falsh[:errors] = @track.errors.full_messages
      redirect_to new_track_url
    end

  end

  def edit
    render :edit
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def update
    @track = Album.find(params[:id])
  end

  def destroy

  end

  private
  def track_params
    params.require(:tracks).permit(:name, :album_id, :track_type, :lyrics)
  end
end
