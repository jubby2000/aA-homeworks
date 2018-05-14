class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def show
    @band = Band.find_by(params[:id])
    redirect_to band_url(@band)
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      render :index
    else
      flash.now[:errors] = @band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def edit

  end


  private
  def band_params
    params.require(:band).permit(:name)
  end
end
