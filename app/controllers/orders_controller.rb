class OrdersController < ApplicationController
  def index
    # Querys order table, and then retrieves each product from product table
    # @orders = Order.all

    # Cleaner and better version
    # Includes the products in the query for orders
    # Less queries overall 
    @orders = Order.includes(:product).all

  end

  def show
    @order = Order.find(params[:id])
  end

  def create
  end

  def destroy
  end

  before_action :authenticate_user!

end
