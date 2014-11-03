json.username current_user.username
json.points current_user.points

json.courses current_user.courses do |course|
  json.title course.title
  json.category course.category
  json.author_id course.author_id
  json.cards course.cards, :id, :course_id, :character, :pinyin, :english
end

json.friends current_user.friends, :id, :username, :points, :email

json.user_card_histories current_user.user_card_histories, :user_id, :card_id,
  :last_studied, :times_right, :times_wrong