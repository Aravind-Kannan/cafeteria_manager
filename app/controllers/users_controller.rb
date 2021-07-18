class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    # render "users/new"
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

  def index
    if current_user.role == "owner"
      render "users/index"
    else
      session[:current_user_id] = nil
      @current_user = nil
      flash[:error] = "Unauthorized"
      redirect_to "/"
    end
  end

  def update
  end
end
