class TrainersController < ApplicationController

  def index
    @trainers = Trainer.order('created_at')
  end

end
