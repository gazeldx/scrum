class Admin::CourseDescriptionsController < Admin::BaseController
  layout 'admin'

  def index
    @course_descriptions = CourseDescription.all
  end

  def show
    @course_description = CourseDescription.find(params[:id])
  end

  def new
    @course_description = CourseDescription.new
  end

  def edit
    @course_description = CourseDescription.find(params[:id])
  end

  def create
    @course_description = CourseDescription.new(params[:course_description])
    if @course_description.save
      redirect_to admin_course_descriptions_path, notice: 'Course description was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @course_description = CourseDescription.find(params[:id])
    if @course_description.update_attributes(params[:course_description])
      redirect_to admin_course_descriptions_path, notice: 'Course description was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @course_description = CourseDescription.find(params[:id])
    @course_description.destroy

    redirect_to admin_course_descriptions_url
  end
end
