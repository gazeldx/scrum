#encoding: utf-8

class UsersController < ApplicationController
  skip_before_filter :authenticate

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_login_and_email(params[:user][:login], params[:user][:email]) || User.new(params[:user])
    if @user.valid?
      @user.save if @user.new_record?
      render json: {download_url: download_users_path, redirect_url: root_path}
    else
      render partial: "users/form"
    end
  end

  def download
    file_path = Rails.root.join("public", "downloads", "New Scrum-Guide 2013新版中英文.rar")
    send_data(File.open(file_path).read, filename: "New Scrum-Guide 2013新版中英文.rar")
  end
end