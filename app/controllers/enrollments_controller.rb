class EnrollmentsController < ApplicationController
  def create
    @enrollment = Enrollment.new(user_id: current_user.id,
                                 course_id: params[:id] )
  end

  def new
  end

  def destroy
  end
end
