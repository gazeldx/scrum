class CoursesController < ApplicationController
  skip_before_filter :authenticate, :only => [:all, :show, :register, :index]
#  def index
#    @courses = Course.where('end_time > ?', Time.now).order('start_time')
#  end


  def index
    @courses = Course.where('end_time > ?', Time.now).order('start_time')
  end

  def background_index
    @courses = Course.order('start_time')
    render :layout => 'admin'
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
    render :layout => 'admin'
  end

  def edit
    @course = Course.find(params[:id])
    render :layout => 'admin'
  end

  def create
    @course = Course.new(params[:course])
    if @course.save!
      redirect_to admin_courses_path, :notice => t('create_succ')
    else
      render :new, :layout => 'admin'
    end
  end

  def update
    p "uuuuuuuuuuuuuuuuuuuuuuuuuuuuu"
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      redirect_to admin_courses_path, :notice => t('update_succ')
    else
      render :edit, :layout => 'admin'
    end
  end

  def register
    @course = Course.find(params[:id])
    @register = Register.new
    render 'registers/new'
  end

#  def destroy
#    @course = Course.find(params[:id])
#    @course.destroy
#    redirect_to courses_url
#  end
end