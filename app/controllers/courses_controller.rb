class CoursesController < ApplicationController
  before_filter :require_sign_in!

  def create
    @course = Course.new(course_params)
    @course.author_id = current_user.id

    if @course.save
      redirect_to new_course_card_url(@course)
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
    categories = []

    @courses.each do |course|
      categories << course.category
    end

    categories.uniq!
    @categories = categories
    render :index
  end

  def show
    @course = Course.find(params[:id])
    @cards = @course.cards
    @comments = Comment.where(course_id: @course.id)
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

  def calc_stats(course)
    correct = 0
    incorrect = 0

    course.each do |card|
      correct += card.times_right
      incorrect += card.times_wrong
    end

    [correct, incorrect]
  end

  private

  def course_params
    params.require(:course).permit(:title, :category)
  end
end
