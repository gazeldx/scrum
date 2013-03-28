class ClassPhotosController < ApplicationController
  skip_before_filter :authenticate, :only => [:index]

  def index
    @class_photos = ClassPhoto.all
  end

  # def background_index
  # 	@courses = Course.where('end_time > ?', Time.now).order('start_time')
  #   render :layout => 'admin'
  # end

  def new
    @class_photo = ClassPhoto.new
    @class_photo.course_id = params[:course_id]
    render :new, :layout => 'admin'
  end

  def edit
    @class_photo = ClassPhoto.find(params[:id])
    render :edit, :layout => 'admin'
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