class Course < ActiveRecord::Base
  validates :title, :category, :author_id, presence: true

  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :cards
  has_many :comments
end
