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

    unless @course.filepicker_url
      @course.filepicker_url =
        "https://www.filepicker.io/api/file/geiPbl4ATeKTvHlrbDXP"
    end

    if @course.save
      render :json => @course
    else
      render :json => @course.errors, :status => :unprocessable_entity
    end
  end
  
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    render :json => @course
  end

  protected

  def course_params
    params.permit(:author_id, :title, :category, :filepicker_url)
  end
end
