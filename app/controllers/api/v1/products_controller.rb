class Api::V1::ProductsController < Api::ApplicationController
  load_resource
  before_action :load_categories, :load_category, only: [:create, :update]
  before_action :authenticate_with_token!, only: [:create, :update]

  def show
    render json: @product
  end

  def new
    @product = Product.new
    @product.image_products.build
  end

  def create
    @product = Product.new product_params
    if @product.save
      render json: @product, status: 200, location: [:api, @category, @product]
    else
      render json: {errors: @product.errors}, status: 420
    end
  end

  def update
    if @product.update_attributes product_params
      render json: @product, status: :ok, location: [:api, @category, @product]
    else
      render json: {errors: @product.errors}, status: :unprocessable_entity
    end
  end

  private
  def load_categories
    @categories = Category.all
  end

  def load_category
    @category = Category.find_by id: params[:category_id]
  end

  def product_params
    params[:product][:image_products_attributes].map {|param|
      param[1]["photo"] = set_param_image_base_64 param[1]["photo"] }
    params.require(:product).permit :name, :price, :quantity, :descriptions,
      :category_id, image_products_attributes: [:id, :product_id, :name, :photo]
  end
end
