class FavoritesController < ApplicationController
  def index
    if params.has_key?(:user_id)
      @favorites = Artwork.where(user_id: params[:user_id])

    else
      @favorites = Artwork.all
    end
    render json: @favorites
  end

  def create
    favorite = Artwork.new(favorite_params)
    if favorite.save!
      render json: favorite
    else
      render json: favorite.errors.full_messages, status: unprocessable_entity
    end
  end

  def destroy
    favorite = Artwork.find_by(id: params[:id])
    if favorite.destroy
      redirect_to favorites, action: :index
    else
      render json: favorite.errors.full_messages, status: unprocessable_entity
    end
  end
end
