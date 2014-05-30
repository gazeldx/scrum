class NewsAndEventsController < ApplicationController

  def index
    @news_and_events = NewsAndEvent.order('posted_on DESC').online
  end

  def show
    @news_and_events = NewsAndEvent.find(params[:id])
  end
end
