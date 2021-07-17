class CartItemsController < ApplicationController
  def create
    cart_item = CartItem.create(
      user_id: current_user.id,
      menu_item_id: params[:id],
      menu_item_name: params[:name],
      menu_item_price: params[:price],
      qty: 1,
    )
    redirect_to new_customer_path
  end

  def destroy
    id = params[:id]
    cart_item = CartItem.find(id)
    cart_item.destroy
    redirect_to new_customer_path
  end

  def update
    id = params[:id]
    cart_item = CartItem.find(id)
    if params[:action] == "up"
      cart_item.qty = cart_item.qty + 1
    elsif params[:action] == "down"
      cart_item.qty = cart_item.qty - 1
    end
    cart_item.save
    redirect_to new_customer_path
  end
end
