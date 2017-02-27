class Api::V1::UsersController < ApplicationController
  load_resource
  respond_to :json

  def show
    respond_with User.find_by id params[:id]
  end

  def create
    @user = User.new user_params
    if @user.save
      render json: @user, status: :created, location: [:api, @user]
    else
      render json: {errors: @user.errors}, status: 422
    end
  end

  def update
    if @user.update_attributes user_params
      render json: @user, status: 200, location: [:api, @user]
    else
      render json: {errors: @user.errors}, status: 422
    end
  end

  private
  def user_params
    params[:user][:avatar] = set_param_image_base_64 params[:user][:avatar]
    params.require(:user).permit User::ATTRIBUTES_PARAMS
  end
end
