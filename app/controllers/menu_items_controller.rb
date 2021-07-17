class MenuItemsController < ApplicationController
  def create
    category = MenuCategory.find_by(name: params[:menu_category])
    new_menu_item = MenuItem.new(
      menu_category_id: category.id,
      name: params[:name],
      description: params[:description],
      price: params[:price],
    )
    if !new_menu_item.save
      flash[:error] = new_menu_item.errors.full_messages.join(", ")
    end
    redirect_to new_owner_path
  end

  def destroy
    id = params[:id]
    menu_item = MenuItem.find(id)
    menu_item.destroy
    redirect_to new_owner_path
  end
end
