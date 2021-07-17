class OrdersController < ApplicationController
  # transfer current Cart contents into OrderItems and Order
  def create
    order = @current_user.orders.create(date: DateTime.now)
    @current_user.cart_items.each do |item|
      order.order_items.create(
        menu_item_id: item[:menu_item_id],
        menu_item_name: item[:menu_item_name],
        menu_item_price: item[:menu_item_price],
        qty: item[:qty],
      )
      item.destroy
    end
    # redirect_to new_customer_path
    render plain: "Success"
  end
end
