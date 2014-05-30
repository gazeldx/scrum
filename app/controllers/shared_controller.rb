class SharedController < ApplicationController

  def contact
    @message = Message.new
  end

end