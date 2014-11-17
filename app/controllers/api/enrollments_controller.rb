class Api::EnrollmentsController < ApplicationController
  def create
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.user_id = current_user.id
    
    if @enrollment.save
      puts "ENROLLMENT SAVED!!!!!!!!!!!!!" # testing
      course = Course.find(params[:course_id])
      create_user_card_history(course)
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
  
  def create_user_card_history(course)
    puts "CREATE_USER_CARD_HISTORY FUNCTION ENTERED" #testing
    
    course.cards.each do |card|

      user_card_history = UserCardHistory.new(
        user_id: current_user.id,
        card_id: card.id,
        last_studied: Time.now
      )

      if user_card_history.save
        puts "USER CARD HISTORY SAVED" # testing
        # add flash alert to say that everythang was aight
      else
        flash["errors"] =
          "Sorry, something went wrong while adding that course."
          redirect_to course_url(course)
      end
    end
  end
end