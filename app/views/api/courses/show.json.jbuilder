json.(@course, :id, :title, :category, :author_id, :filepicker_url)

json.cards @course.cards, :id, :character, :pinyin, :english, :course_id

json.comments @course.comments, :id, :author_id, :course_id, :content, :created_at, :updated_at