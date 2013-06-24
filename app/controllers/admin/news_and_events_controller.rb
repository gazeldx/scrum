class Admin::NewsAndEventsController < ApplicationController
  layout 'admin'

  def index
    @news_and_events = NewsAndEvent.order('posted_on DESC')
  end

  def edit
    @news_and_event = NewsAndEvent.find(params[:id])
  end

  def update
    @news_and_event = NewsAndEvent.find(params[:id])

    if @news_and_event.update_attributes(params[:news_and_event])
      redirect_to admin_news_and_events_url, notice: "Update successfully!"
    else
      render :edit
    end
  end

  def new
    @news_and_event = NewsAndEvent.new
  end

  def create
    @news_and_event = NewsAndEvent.new(params[:news_and_event])

    if @news_and_event.save
      redirect_to admin_news_and_events_url, notice: "Created successfully!"
    else
      render :new
    end
  end

end
