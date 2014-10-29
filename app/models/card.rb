class Card < ActiveRecord::Base
  validates :course_id, presence: true

  belongs_to :course
  has_many :user_card_histories, dependent: :destroy
  has_many :cards, through: :user_card_histories

end
