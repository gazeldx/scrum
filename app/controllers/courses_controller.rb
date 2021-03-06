class CoursesController < ApplicationController
  before_filter :authenticate
  skip_before_filter :authenticate, :only => [:all, :show, :register, :index]#, :background_index, :new, :edit, :create, :update, :destroy_all_class_photos, :destroy]

  def index
    #@courses = Course.where('end_time > ?', Time.new(2014)).order('start_time desc')
    @courses = Course.order('start_time desc').paginate(page: (params[:page] || 1), per_page: (params[:per_page] || 20))
  end

  def background_index
    @courses = Course.order('start_time desc').paginate(page: (params[:page] || 1), per_page: (params[:per_page] || 20))
    render :layout => 'admin'
  end

  def show
    @course = Course.find(params[:id])
    @course_description =  @course.course_description
    unless @course.trainer.name.include? "Jim"
      @jim = Trainer.find_by_url("Jim-Wang")
    end
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

  def destroy_all_class_photos
    course = Course.find(params[:id])
    course.class_photos.delete_all
    redirect_to admin_courses_path, :notice => t('delete_succ')
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to admin_courses_url
  end
end