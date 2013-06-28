class NewsAndEventsController < ApplicationController
  skip_before_filter :authenticate

  def index
    @news_and_events = NewsAndEvent.order('posted_on DESC').online
  end
end
