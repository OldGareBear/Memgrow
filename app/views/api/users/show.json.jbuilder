json.user do 
  json.username @user.username
  json.points @user.points
  
  json.courses @user.courses do |course|
    json.title course.title
    json.category course.category
    json.author_id course.author_id
    json.cards course.cards, :id, :course_id, :character, :pinyin, :english
  end
  
  json.friends @user.friends, :id
  
  json.user_card_histories @user.user_card_histories, :user_id, :card_id, :last_studied, 
    :times_right, :times_wrong
end