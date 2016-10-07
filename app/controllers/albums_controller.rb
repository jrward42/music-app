class AlbumsController < ApplicationController
  before_action :ensure_logged_in

  def new
    @band = Band.find_by(params[:id])
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    band_name = params[:band_name]
    band = Band.find_by(name: band_name)
    @album.band_id = band.id
    if @album.save
      redirect_to album_url(@album)
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def destroy
    render :show
  end

  def album_params
    params.require(:album).permit(:title, :band_id, :live)
  end
end
