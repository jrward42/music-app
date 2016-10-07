class TracksController < ApplicationController
  def new
    @album = Album.find_by(params[:id])
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    album_title = params[:album_title]
    album = Album.find_by(title: album_title)
    @track.album_id = album.id

    if @track.save
      redirect_to track_url(@track)
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def destroy
    redirect_to bands_url
  end

  def track_params
    params.require(:track).permit(:title, :album_id, :bonus, :lyrics)
  end
end
