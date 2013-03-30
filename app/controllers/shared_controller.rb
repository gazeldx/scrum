class SharedController < ApplicationController
  skip_before_filter :authenticate

  def contact
    @message = Message.new
  end

end