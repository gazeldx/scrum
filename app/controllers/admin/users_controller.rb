class Admin::UsersController < ApplicationController
  layout "admin"

  def index
    @users = User.order("reviewed asc").all
  end

  def mark_as_reviewed
    user = User.find(params[:id])
    user.update_attributes(reviewed: true) if user
    redirect_to admin_users_path
  end

end