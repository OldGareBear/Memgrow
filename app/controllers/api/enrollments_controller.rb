class Api::EnrollmentsController < ApplicationController
  def create
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.user_id = current_user.id
    
    if @enrollment.save
      render :json => @enrollment
    else
      render :json => @enrollment.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
  end
  
  protected
  
  def enrollment_params
    params.permit(:course_id)
  end
end