class Course < ActiveRecord::Base
  validates :title, :category, presence: true
end
