class ClassPhotosController < ApplicationController
  before_filter :authenticate, :only => [:new, :create]

  def index
  	@courses = Course.includes(:class_photos).order('start_time DESC')
  end

  def year
    @courses = Course.includes(:class_photos).by_year(params[:year]).order('start_time DESC')
    render :index
  end

  #----below methods are background methods.
  def new
     @class_photo = ClassPhoto.new
     @class_photo.course_id = params[:course_id]
     render :new, :layout => 'admin'
  end

  def create
    @class_photo = ClassPhoto.new(params[:class_photo])
    if @class_photo.save!
      redirect_to admin_courses_path, :notice => t('create_succ')
    else
      render :new, :layout => 'admin'
    end
  end

end