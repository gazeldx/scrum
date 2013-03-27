class StudentsController < ApplicationController
  skip_before_filter :authenticate

  def index
    @students = Student.all
  end

  def background_index
    @students = Student.order('created_at')
    render :layout => 'admin'
  end

end