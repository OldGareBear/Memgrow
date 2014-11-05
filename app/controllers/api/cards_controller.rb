class Api::CardsController < ApplicationController
  def create
    @card = Card.new(card_params)
    
    if @card.save
      render :json => @card
    else
      render :json => @card.errors, :status => :unprocessable_entity
    end
  end
  
  protected
  
  def card_params
    params.permit(:course_id, :character, :pinyin, :english)
  end
end