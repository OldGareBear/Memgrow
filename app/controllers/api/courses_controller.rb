class Api::CoursesController < ApplicationController
  def index
    @courses = Course.all
    render :index
  end

  def show
    @course = Course.find(params[:id])
    render :show
  end
  
  def create
    @course = Course.new(course_params)
    if @course.save
      render :json => @course
    else
      render :json => @course.errors, :status => :unprocessable_entity
    end
  end
  
  protected
  
  def course_params
    params.permit(:author_id, :title, :category)
  end
end