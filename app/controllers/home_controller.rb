class HomeController < ApplicationController
  skip_before_filter :authenticate

  def index
    @news = NewsAndEvent.online.order('posted_on DESC').limit(7)
  end
end