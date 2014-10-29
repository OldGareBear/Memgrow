class Card < ActiveRecord::Base
  validates :course_id, presence: true
  
  belongs_to :course
end
