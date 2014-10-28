class CoursesController < ApplicationController
  def create
    @course = Course.new(course_params)
    @course.author_id = current_user.id

    if @course.save
      redirect_to course_url(@course)
      # ultimately, this should actually redirect to a form where you can
      # create cards that are ensted under the course; wait until the card
      # model and controller have been created
    else
      flash.now[:errors] = @course.errors.full_messages
    end
  end

  def new
    @course = Course.new
    render :new
  end

  def index
    @courses = Course.all
    render :index
  end

  def show
    @course = Course.find(params[:id])
    render :show
  end

  def edit
    @course = Course.find(params[:id])
    render :edit
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to course_url(@course)
    else
      flash.now[:errors] = @course.errors.full_messages
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy()
    redirect_to courses_url
  end

  private

  def course_params
    params.require(:course).permit(:title, :category)
  end
end
