class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json
  before_action :load_user, only: [:index, :show]

  def show
    respond_with @user.orders.find_by id: params[:id]
  end

  def index
    respond_with @user.orders
  end

  def create
    order = current_user.orders.build
    order.build_product_orders_with_product_ids_and_quantities params[:order][:product_ids_and_quantities]

    if order.save
      order.reload
      render json: order, status: 201, location: [:api, current_user, order]
    else
      render json: {errors: order.errors}, status: 422
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:user_id]
  end

  def order_params
    params.require(:order).permit :user_id, :total, product_ids_and_quantities: []
  end
end
