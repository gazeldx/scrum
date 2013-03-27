class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate
  #before_filter :handle_sub_domain

  #TODO NEEDN'T DO THIS NOW BECAUSE I use in
  #server {
  #        server_name  www.shinescrum.com;
  #        rewrite ^(.*) http://shinescrum.com$1 permanent;
  #    }
  # in /etc/nginx/nginx.conf
  #
  #def handle_sub_domain
  #  redirect_to "http://shinescrum.com" if request.subdomain.present?
  #end

  private
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      Digest::SHA1.hexdigest(user_name) == "1cd02e31b43620d7c664e038ca42a060d61727b9" && Digest::SHA1.hexdigest(password) == "f405b29972640b3906fc936d8a88cac653f9eb62"
    end
  end

#  def auth2
#    authenticate_or_request_with_http_basic do |user_name, password|
#      user_name == "jim" && password == "shinetech"
#    end
#  end
end
