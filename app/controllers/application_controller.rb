class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate, :handle_sub_domain

  def handle_sub_domain
    redirect_to "http://shinescrum.com" if request.subdomain.present?
  end

  private
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == "jim" && password == "shinetech"
    end
  end
end
