class Enrollment < ActiveRecord::Base
  validates :user_id, :course_id, presence: true

  belongs_to :user
  belongs_to :course
end
