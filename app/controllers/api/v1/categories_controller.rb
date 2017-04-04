class Api::V1::CategoriesController < ApplicationController
  load_resource
  respond_to :json
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  before_action :create_cmapi, only: :show

  def show
    render json: @category
  end

  def index
    @categories = Category.all
    render json: @categories
  end

  def create
    @category = Category.new category_params
    if @category.save
      render json: @category, status: :created, location: [:api, @category]
    else
      render json: {errors: @category.errors}, status: 422
    end
  end

  def update
    if @category.update_attributes category_params
      render json: @category, status: :updated, location: [:api, @category]
    else
      render json: {errors: @category.errors}, status: :update_failed
    end
  end

  def destroy
    if @category.destroy
      render json: {success: t(".success")}, status: :deleted
    else
      render json: {failed: t(".failed")}, status: 422
    end
  end

  private
  def create_cmapi
    @products = Product.all
    @users = User.all
    @list_cmapi = ExportCmapi.new(@products, @users).get_list_cmapi
  end

  def category_params
    params.require(:category).permit :name
  end
end
