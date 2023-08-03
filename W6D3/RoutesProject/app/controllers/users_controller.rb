class UsersController < ApplicationController
  def index
     if params.has_key?(:search)
      user = User.search_by_name(params[:search])
    else
      user = User.find(params[:id])
    end
    render json: user
  end

  def create
    user = User.new(params.require(:user).permit(:name))
    # replace the `user_attributes_here` with the actual attribute keys
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    if params.has_key?(:search)
      user = User.search_by_name(params[:search])
    else
      user = User.find(params[:id])
    end
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    render json: user
  end

  def destroy
    User.destroy(params[:id])

    redirect_to controller: :users, action: :index
  end
  private

  def user_params
    params.require(:user).permit(:name)
  end
end
