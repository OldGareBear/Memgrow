class UserCardHistoriesController < ApplicationController
  # def create
  # end

  def update
    @history = UserCardHistory.find(params[:id])

    pinyin_answer = params[:answer][:pinyin]
    english_answer = params[:answer][:english]

    card = Card.find(@history.card_id)
    user = User.find(@history.user_id)

    if card.pinyin == pinyin_answer && card.english == english_answer
      times_right = @history.times_right + 1
    else
      times_wrong = @history.times_wrong += 1
    end

    last_studied = Time.now

    @history.update(
      times_right: times_right,
      times_wrong: times_wrong,
      last_studied: last_studied
    )
    @history.save!

    redirect_to user_url(current_user)
  end

  def destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:pinyin, :english)
  end
end
