class TrainersController < ApplicationController

  def index
    @trainers = Trainer.order('created_at')
  end

  def background_index
    @trainers = Trainer.order('created_at')
    render :layout => 'admin'
  end

  def show
    @trainer = Trainer.find_by_url(params[:url])
  end

  def new
    @trainer = Trainer.new
    render :new, :layout => 'admin'
  end

  def edit
    @trainer = Trainer.find(params[:id])
    render :edit, :layout => 'admin'
  end

  def create
    @trainer = Trainer.new(params[:trainer])
    if @trainer.save!
      redirect_to admin_trainers_path, :notice => t('create_succ')
    else
      render :new, :layout => 'admin'
    end    
  end

  def update
    @trainer = Trainer.find(params[:id])
    if @trainer.update_attributes(params[:trainer])
      redirect_to edit_trainer_path, :notice => t('update_succ')
    else
      render :edit
    end
  end

end
