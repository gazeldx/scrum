class Admin::BaseController < ApplicationController
  before_filter :authenticate

  layout 'admin'
  
  protect_from_forgery

end
