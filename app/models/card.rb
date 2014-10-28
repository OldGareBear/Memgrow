class Card < ActiveRecord::Base
  validates :card_id
  
  belongs_to :course
end
