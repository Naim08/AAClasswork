class ArtworkSharesController < ApplicationController
  def create
    artworkshare = ArtworkShare.new(artworkshare_params)
    if artworkshare.save
      render json: artworkshare
    else
      render json: artworkshare.errors.full_messages, status: unprocessable_entity
    end
  end

  def destroy
    artworkshare = ArtworkShare.find_by(id: params[:id])
    if artworkshare.destroy
      redirect_to artworkshares, action: :index
    else
      render json: artworkshare.errors.full_messages, status: unprocessable_entity
    end
  end

  private

  def artworkshare_params
    params.require(:artworkshare).permit(:artwork_id, :viewer_id)
  end
end
