class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy]

    def set_band
      @band = Band.find(params[:id])
    end

  def new
    @band = Band.new
    render :new
  end

  def create

    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      render :new
    end

  end

  def show
    render :show
  end

  def index
    @bands = Band.all
    render :index
  end

  def edit
        render :edit
  end

  def update


    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      render :edit
    end

  end

  def destroy
    @band.destroy
    redirect_to bands_url
  end

  private

  def band_params

    params.require(:band).permit(:name)
  end
end
