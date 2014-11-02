class StaticPagesController < ApplicationController
  def home
    render :home
  end
  
  def dashboard
    # find the number of words the user is studying
    cards_count = 0
    current_user.courses.each do |course|
      cards_count += course.cards.count
    end
    @cards_count = cards_count

    # find the stats for the user
    @cards_studied, @study_errors = calc_stats(current_user)

    # generate the leaderboard
    @leaders = current_user.friends.sort_by(&:points).reverse[0, 10]
    render :dashboard
  end
  
  private 
  
  def calc_stats(user)
    correct = 0
    incorrect = 0

    user.user_card_histories.each do |card|
      correct += card.times_right
      incorrect += card.times_wrong
    end

    [incorrect + correct, incorrect]
  end
end
