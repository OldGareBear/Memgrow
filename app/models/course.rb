class Course < ActiveRecord::Base
  validates :title, :category, presence: true

  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :cards
end
