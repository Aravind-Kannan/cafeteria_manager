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
    c_id = params[:id]
    cart_item = CartItem.find(c_id)
    if params[:count] == "+"
      cart_item.qty = cart_item.qty + 1
    elsif params[:count] == "-"
      cart_item.qty = cart_item.qty - 1
    end
    cart_item.save
    if cart_item.qty <= 0
      cart_item.destroy
    end
    redirect_to new_customer_path
  end
end
