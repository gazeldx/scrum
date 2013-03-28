class ClassPhotosController < ApplicationController
  skip_before_filter :authenticate, :only => [:index]

  def index
  	@courses = Course.includes(:class_photos).order('start_time DESC')
    # @class_photos = ClassPhoto.includes(:course).order('Course.start_time DESC')
  end

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