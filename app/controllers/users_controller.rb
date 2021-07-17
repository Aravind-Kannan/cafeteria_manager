class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
    user = User.new(
      name: params[:name],
      role: "customer",
      email: params[:email],
      password: params[:password],
    )
    if !user.save
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    else
      session[:current_user_id] = user.id
      redirect_to "/"
    end
  end
end
