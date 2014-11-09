json.(@course, :id, :title, :category, :author_id, :filepicker_url)

json.cards @course.cards, :id, :character, :pinyin, :english, :course_id