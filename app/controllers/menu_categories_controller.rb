class MenuCategoriesController < ApplicationController
  def create
    menu_category = MenuCategory.create(
      name: params[:name],
    )
    redirect_to new_owner_path
  end

  def destroy
    id = params[:id]
    menu_category = MenuCategory.find(id)
    menu_category.destroy
    redirect_to new_owner_path
  end

  def update
    id = params[:id]
    menu_category = MenuCategory.find(id)
    menu_category.active = !menu_category.active
    menu_category.save
    redirect_to new_owner_path
  end
end
