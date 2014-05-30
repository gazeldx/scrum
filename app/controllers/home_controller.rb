class HomeController < ApplicationController

  def index
    @news = NewsAndEvent.online.order('posted_on DESC').limit(7)
  end
end