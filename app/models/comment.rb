class Comment < ActiveRecord::Base
  validates :author_id, :course_id, :content, presence: true

  belongs_to :course
  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )
end