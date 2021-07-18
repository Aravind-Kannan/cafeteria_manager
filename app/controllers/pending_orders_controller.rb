class PendingOrdersController < ApplicationController
  def new
    # ensure "clerk/owner - login"
    if @current_user.role == "customer"
      session[:current_user_id] = nil
      @current_user = nil
      flash[:error] = "Unauthorized"
      redirect_to "/"
    end
  end
end
