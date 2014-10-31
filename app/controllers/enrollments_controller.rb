class EnrollmentsController < ApplicationController
  def create
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.user_id = current_user.id

    if @enrollment.save
      # I want to generate a history at enrollment so that I know to always
      # update and never create at study time; I feel like that would probably
      # lead to uneccesary queries to find out whether a history already exists
      course = Course.find(params[:enrollment][:course_id])
      create_user_card_history(course)

      redirect_to courses_url
    else # should never fire, really
      flash[:errors] = @enrollment.errors.full_messages
      redirect_to course_url(@enrollment.course_id)
    end
  end

  def destroy
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:course_id)
  end

  def create_user_card_history(course)
    course.cards.each do |card|

      user_card_history = UserCardHistory.new(
        user_id: current_user.id,
        card_id: card.id
      )

      if user_card_history.save
        # add flash alert to say that everythang was aight
      else
        flash["errors"] =
          "Sorry, something went wrong while adding that course."
          redirect_to course_url(course)
      end
    end
  end
end
