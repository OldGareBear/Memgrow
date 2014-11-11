json.id current_user.id
json.username current_user.username
json.points (@cards_studied - @study_errors)
json.filepicker_url current_user.filepicker_url

json.friends_pic image_path("friends.png")
json.words_pic image_path("baby_panda.png")
json.points_pic image_path("star.png")
json.stats_pic image_path("stats.png")
json.courses_pic image_path("course.png")
json.leaders_pic image_path("trophy.png")

json.courses current_user.courses do |course|
  json.id course.id
  json.title course.title
  json.category course.category
  json.author_id course.author_id
  json.cards course.cards, :id, :course_id, :character, :pinyin, :english
end

json.cards_count @cards_count

json.friend_requests current_user.friendships_awaiting_acceptance, :id, :requester_id, :requestee_id, :status

json.friends current_user.friends, :id, :username, :points, :email, :filepicker_url

json.cards_studied @cards_studied

json.study_errors @study_errors

json.user_card_histories current_user.user_card_histories do |history|
  json.id history.id
  json.user_id history.user_id
  json.card_id history.card_id
  json.last_studied history.last_studied
  json.times_right history.times_right
  json.times_wrong history.times_wrong
  json.times_right_since_last_mistake history.times_right_since_last_mistake
  json.card_status 
end