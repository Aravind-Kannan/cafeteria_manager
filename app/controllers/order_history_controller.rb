class OrderHistoryController < ApplicationController
  def new
    # ensure "customer - login"
    if @current_user.role != "customer"
      session[:current_user_id] = nil
      @current_user = nil
      flash[:error] = "Unauthorized! No order_history for clerk/owner!"
      redirect_to "/"
    end
  end
end
