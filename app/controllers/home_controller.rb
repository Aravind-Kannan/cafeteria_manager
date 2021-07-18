class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    if current_user
      if current_user.role == "owner"
        redirect_to new_pending_orders_path
      elsif current_user.role == "customer"
        redirect_to new_customer_path
      end
    else
      render "index"
    end
  end
end
