json.(@course, :id, :title, :category, :author_id)

json.cards @course.cards, :id, :character, :pinyin, :english, :course_id