<<<<<<< HEAD
class Admin::OrdersController < ApplicationController

  def index
  end

  def show
  end
  
  def update 
  end
end
=======
class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
    @orderdetails = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order)
  end

  private
  def order_params
    params.require(:order).permit(:name, :status)
  end
end
>>>>>>> member_orderdetails
