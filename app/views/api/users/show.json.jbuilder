json.id @user.id
json.username @user.username
json.points @user.points
json.filepicker_url @user.filepicker_url

json.courses @user.courses do |course|
  json.id course.id
  json.title course.title
  json.category course.category
  json.author_id course.author_id
  json.cards course.cards, :id, :course_id, :character, :pinyin, :english
end

json.cards_studied @cards_studied
json.cards_count @cards_count
json.study_errors @study_errors

json.friends @user.friends, :id, :username, :points, :email

json.user_card_histories @user.user_card_histories, :user_id, :card_id,
  :last_studied, :times_right, :times_wrong
