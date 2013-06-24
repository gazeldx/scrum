class TrainersController < ApplicationController
  skip_before_filter :authenticate, :only => [:team, :show, :register]
  include OrderByCreatedAt
  
  def index
    @trainers = Trainer.order('created_at')
    @trainer = @trainers.first
  end

  def team
    @trainers = Trainer.order('created_at')
    @trainer = @trainers.first
  end

  def background_index
    @trainers = Trainer.order('created_at')
    render :layout => 'admin'
  end

  def show
    @trainers = Trainer.order('created_at')
    @trainer = Trainer.find_by_url(params[:url])
    render 'team'
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

  def destroy
    @trainer = Trainer.find(params[:id])
    if @trainer.courses.exists?
      flash[:error] = 'This trainer has courses so you can\'t delete.'
    else
      @trainer.destroy
      flash[:notice] = 'Delete success.'
    end
    redirect_to admin_trainers_path
  end

end
