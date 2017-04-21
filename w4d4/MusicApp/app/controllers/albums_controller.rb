class AlbumsController < ApplicationController

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      falsh[:errors] = @album.errors.full_messages
      redirect_to new_band_album_url
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def new
    @album = Album.new
    render :new
  end

  private
  def album_params
    params.require(:albums).permit(:name, :band_id, :album_type)
  end
end
