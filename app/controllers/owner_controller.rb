class OwnerController < ApplicationController
  def new
    if @current_user.role != "owner"
      flash[:error] = "You are not owner!"
      session[:current_user_id] = nil
      @current_user = nil
      redirect_to "/"
    end
  end
end
