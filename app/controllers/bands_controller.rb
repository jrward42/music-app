class BandsController < ApplicationController
  

  def index
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    end
  end

  def destroy
    render :index
  end

  def show
     @band = Band.find(params[:id])
     render :show
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
