class EnrollmentsController < ApplicationController
  def create
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.user_id = current_user.id

    if @enrollment.save
      redirect_to course_url(@enrollment.course_id)
    else # should never fire
      flash.now[:errors] = @enrollment.errors.full_messages
      render 'courses#show'
    end
  end

  def destroy
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:course_id)
  end
end
