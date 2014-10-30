class UserCardHistoriesController < ApplicationController
  # def create
  # end

  def update # refactor this ish baby!
    @history = UserCardHistory.find(params[:id])

    pinyin_answer = params[:answer][:pinyin]
    english_answer = params[:answer][:english]

    card = Card.find(@history.card_id)
    user = User.find(@history.user_id)

    if card.pinyin == pinyin_answer && card.english == english_answer
      times_right = @history.times_right + 1
      user.points += 1
      user.save!
      last_studied = Time.now
    else
      times_wrong = @history.times_wrong + 1
    end

    @history.update(
      times_right: times_right || @history.times_right,
      times_wrong: times_wrong || @history.times_wrong,
      last_studied: last_studied || @history.last_studied
    )
    @history.save!

    # logic for redirecting to the right card (or maybe course if all cards
    # have been studied)
    course_cards = card.course.cards
    current_index = course_cards.index(card)
    next_card = course_cards[current_index + 1]

    if next_card
      redirect_to course_card_url(card.course, next_card) # show next card
    else
      redirect_to user_url(current_user)
    end
  end

  def destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:pinyin, :english)
  end
end
