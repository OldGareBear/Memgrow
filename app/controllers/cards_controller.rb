class CardsController < ApplicationController
  def new
    @card = Card.new
    @course = Course.find(params[:course_id])
    render :new
  end

  def create
    @card = Card.new(card_params)
    @card.course_id = params[:course_id]

    if @card.save
      redirect_to new_course_card_url
    else
      flash.now["errors"] = @card.errors.full_messages
    end
  end

  def show
    @card = Card.find(params[:id])
    render :show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def card_params
    params.require(:card).permit(:character, :pinyin, :english)
  end
end
