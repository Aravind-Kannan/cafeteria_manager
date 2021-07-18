class OrdersController < ApplicationController
  # transfer current Cart contents into OrderItems and Order
  def create
    if @current_user.role != "customer"
      order = User.find_by(name: "Walk-in Customer").orders.create(date: DateTime.now)
    else
      order = @current_user.orders.create(date: DateTime.now)
    end
    @current_user.cart_items.each do |item|
      order.order_items.create(
        menu_item_id: item[:menu_item_id],
        menu_item_name: item[:menu_item_name],
        menu_item_price: item[:menu_item_price],
        qty: item[:qty],
      )
      item.destroy
    end
    if @current_user.role != "customer"
      redirect_to new_pending_orders_path
    else
      redirect_to new_order_history_path
    end
  end

  def update
    if @current_user.role != "customer"
      order = Order.find_by(id: params[:id])
      order.delivered_at = DateTime.now
      order.save
      flash[:error] = "Delivered"
    else
      flash[:error] = "Unauthorised!"
    end
    redirect_to "/"
  end
end
