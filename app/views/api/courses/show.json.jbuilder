json.(@course, :id, :title, :category, :author_id, :filepicker_url)

json.cards @course.cards, :id, :character, :pinyin, :english, :course_id

json.comments @course.comments do |comment|
  json.id         comment.id
  json.author_id  comment.author_id
  json.course_id  comment.course_id
  json.content    comment.content
  json.created_at comment.created_at
  json.updated_at comment.updated_at
  json.author     comment.author.username
end

# json.comments @course.comments, :id, :author_id, :course_id, :content, :created_at, :updated_at, :author
