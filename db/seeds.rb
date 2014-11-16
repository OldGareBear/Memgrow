# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([ name: 'Chicago' ,  name: 'Copenhagen' ])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.create!( email: "kate@kate.com",
              password: "password",
              username: "Kate",
              points: 100_000,
              filepicker_url: "https://www.filepicker.io/api/file/Di7mO5QQwO1kd7bg1N9U")
              kate_id = 1
User.create!( email: "gary@gary.com",
              password: "password",
              username: "Gary",
              points: 1000,
              filepicker_url: "https://www.filepicker.io/api/file/QA0ELA1TUux2KkIQyXWX")
              gary_id = 2
User.create!( email: "colin@colin.colin",
              password: "password",
              username: "Colin",
              points: 995,
              filepicker_url: "https://www.filepicker.io/api/file/ywbypgQxSMa0wrK3XR97")
              colin_id = 3
User.create!( email: "dave@dave.com",
              password: "password",
              username: "Dave",
              points: 437,
              filepicker_url: "https://www.filepicker.io/api/file/8K351T2ETGGQALCIxOUh")
              dave_id = 4
User.create!( email: "steve@steve.com",
              password: "password",
              username: "Steve",
              points: 762,
              filepicker_url: "https://www.filepicker.io/api/file/RuChkLYuR0qR5kDJFm8D")
              steve_id = 5
User.create!( email: "dom@dom.com",
              password: "password",
              username: "Dom",
              points: 11,
              filepicker_url: "https://www.filepicker.io/api/file/QA0ELA1TUux2KkIQyXWX")
              dom_id = 6

rando_1 = 50
rando_2 = 51
rando_3 = 52

Friendship.create!( requester_id: kate_id,
                    requestee_id: gary_id,
                    status: "accepted")
Friendship.create!( requester_id: gary_id,
                    requestee_id: colin_id,
                    status: "accepted")
Friendship.create!( requester_id: colin_id,
                    requestee_id: dave_id,
                    status: "accepted")
Friendship.create!( requester_id: dave_id,
                    requestee_id: steve_id,
                    status: "accepted")
Friendship.create!( requester_id: steve_id,
                    requestee_id: dom_id,
                    status: "accepted")
Friendship.create!( requester_id: dave_id,
                    requestee_id: gary_id,
                    status: "accepted")
Friendship.create!( requester_id: colin_id,
                    requestee_id: steve_id,
                    status: "accepted")
Friendship.create!( requester_id: dave_id,
                    requestee_id: dom_id,
                    status: "accepted")
Friendship.create!( requester_id: kate_id,
                    requestee_id: colin_id,
                    status: "accepted")
Friendship.create!( requester_id: dave_id,
                    requestee_id: kate_id,
                    status: "accepted")
Friendship.create!( requester_id: steve_id,
                    requestee_id: gary_id,
                    status: "accepted")
Friendship.create!( requester_id: dom_id,
                    requestee_id: colin_id,
                    status: "accepted")
Friendship.create!( requester_id: gary_id,
                    requestee_id: dom_id,
                    status: "accepted")
Friendship.create!( requester_id: kate_id,
                    requestee_id: steve_id,
                    status: "accepted")
Friendship.create!( requester_id: kate_id,
                    requestee_id: dom_id,
                    status: "accepted")
Friendship.create!( requester_id: rando_1,
                    requestee_id: dave_id,
                    status: "pending")
Friendship.create!( requester_id: rando_2,
                    requestee_id: dave_id,
                    status: "pending")
Friendship.create!( requester_id: rando_3,
                    requestee_id: dave_id,
                    status: "pending")

Course.create!( title: "Fruits and Veggies",
  category: "Food",
  author_id: kate_id,
  filepicker_url: "https://www.filepicker.io/api/file/geiPbl4ATeKTvHlrbDXP" )
Course.create!( title: "Meats",
  category: "Food",
  author_id: gary_id,
  filepicker_url: "https://www.filepicker.io/api/file/geiPbl4ATeKTvHlrbDXP" )
Course.create!( title: "Taking Taxies",
  category: "Transportation",
  author_id: kate_id,
  filepicker_url: "https://www.filepicker.io/api/file/geiPbl4ATeKTvHlrbDXP" )
Course.create!( title: "Furniture",
  category: "Around the House",
  author_id: colin_id,
  filepicker_url: "https://www.filepicker.io/api/file/geiPbl4ATeKTvHlrbDXP" )


Card.create!( course_id: kate_id,
  character: "苹果",
  pinyin: "pingguo",
  english: "apple" )

Card.create!( course_id: kate_id,
  character: "南瓜",
  pinyin: "nangua",
  english: "pumkin" )

Card.create!( course_id: kate_id,
  character: "李",
  pinyin: "li",
  english: "pear" )

Card.create!( course_id: kate_id,
  character: "牛肉",
  pinyin: "niurou",
  english: "beef" )

Card.create!( course_id: kate_id,
  character: "鱼",
  pinyin: "yu",
  english: "fish" )

Card.create!( course_id: kate_id,
  character: "猪肉",
  pinyin: "zhurou",
  english: "pork" )

Card.create!( course_id: colin_id,
  character: "打表",
  pinyin: "dabiao",
  english: "use the meter" )
  dabiao_id = 7

Card.create!( course_id: colin_id,
  character: "北京大学西南门儿",
  pinyin: "pingguo",
  english: "apple" )
  pingguo_id = 8

Card.create!( course_id: dave_id,
  character: "沙发",
  pinyin: "shafa",
  english: "sofa" )
  shafa_id = 9

Card.create!( course_id: dave_id,
  character: "椅子",
  pinyin: "yizi",
  english: "chair" )
  yizi_id = 10

Enrollment.create!(user_id: kate_id, course_id: kate_id)
Enrollment.create!(user_id: kate_id, course_id: kate_id)
Enrollment.create!(user_id: kate_id, course_id: colin_id)
Enrollment.create!(user_id: gary_id, course_id: dave_id)
Enrollment.create!(user_id: gary_id, course_id: kate_id)
Enrollment.create!(user_id: gary_id, course_id: kate_id)
Enrollment.create!(user_id: colin_id, course_id: colin_id)
Enrollment.create!(user_id: colin_id, course_id: dave_id)
Enrollment.create!(user_id: colin_id, course_id: kate_id)
Enrollment.create!(user_id: dave_id, course_id: kate_id)
Enrollment.create!(user_id: dave_id, course_id: colin_id)
Enrollment.create!(user_id: dave_id, course_id: dave_id)
Enrollment.create!(user_id: steve_id, course_id: kate_id)
Enrollment.create!(user_id: steve_id, course_id: kate_id)
Enrollment.create!(user_id: steve_id, course_id: colin_id)
Enrollment.create!(user_id: dom_id, course_id: dave_id)
Enrollment.create!(user_id: dom_id, course_id: kate_id)
Enrollment.create!(user_id: dom_id, course_id: kate_id)

UserCardHistory.create!(user_id: kate_id,
                        card_id: kate_id,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
UserCardHistory.create!(user_id: kate_id,
                        card_id: gary_id,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
UserCardHistory.create!(user_id: kate_id,
                        card_id: colin_id,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
UserCardHistory.create!(user_id: kate_id,
                        card_id: dave_id,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
UserCardHistory.create!(user_id: kate_id,
                        card_id: dave_id,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
UserCardHistory.create!(user_id: kate_id,
                        card_id: dom_id,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
UserCardHistory.create!(user_id: kate_id,
                        card_id: dabiao_id,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
UserCardHistory.create!(user_id: kate_id,
                        card_id: pingguo_id,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
  UserCardHistory.create!(user_id: gary_id,
                          card_id: kate_id,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
  UserCardHistory.create!(user_id: gary_id,
                          card_id: gary_id,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
  UserCardHistory.create!(user_id: gary_id,
                          card_id: colin_id,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
  UserCardHistory.create!(user_id: gary_id,
                          card_id: dave_id,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
  UserCardHistory.create!(user_id: gary_id,
                          card_id: steve_id,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
  UserCardHistory.create!(user_id: gary_id,
                          card_id: dom_id,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
  UserCardHistory.create!(user_id: gary_id,
                          card_id: shafa_id,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
  UserCardHistory.create!(user_id: gary_id,
                          card_id: kate_id0,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
    UserCardHistory.create!(user_id: colin_id,
                            card_id: kate_id,
                            times_right: 0,
                            times_wrong: 0, times_right_since_last_mistake: 0, 
                            last_studied: Time.now)
    UserCardHistory.create!(user_id: colin_id,
                            card_id: gary_id,
                            times_right: 0,
                            times_wrong: 0, times_right_since_last_mistake: 0, 
                            last_studied: Time.now)
    UserCardHistory.create!(user_id: colin_id,
                            card_id: colin_id,
                            times_right: 0,
                            times_wrong: 0, times_right_since_last_mistake: 0, 
                            last_studied: Time.now)
    UserCardHistory.create!(user_id: colin_id,
                            card_id: dabiao_id,
                            times_right: 0,
                            times_wrong: 0, times_right_since_last_mistake: 0, 
                            last_studied: Time.now)
    UserCardHistory.create!(user_id: colin_id,
                            card_id: pingguo_id,
                            times_right: 0,
                            times_wrong: 0, times_right_since_last_mistake: 0, 
                            last_studied: Time.now)
    UserCardHistory.create!(user_id: colin_id,
                            card_id: shafa_id,
                            times_right: 0,
                            times_wrong: 0, times_right_since_last_mistake: 0, 
                            last_studied: Time.now)
    UserCardHistory.create!(user_id: colin_id,
                            card_id: kate_id0,
                            times_right: 0,
                            times_wrong: 0, times_right_since_last_mistake: 0, 
                            last_studied: Time.now)
      UserCardHistory.create!(user_id: dave_id,
                              card_id: dave_id,
                              times_right: 0,
                              times_wrong: 0, times_right_since_last_mistake: 0, 
                              last_studied: Time.now)
      UserCardHistory.create!(user_id: dave_id,
                              card_id: steve_id,
                              times_right: 0,
                              times_wrong: 0, times_right_since_last_mistake: 0, 
                              last_studied: Time.now)
      UserCardHistory.create!(user_id: dave_id,
                              card_id: dom_id,
                              times_right: 0,
                              times_wrong: 0, times_right_since_last_mistake: 0, 
                              last_studied: Time.now)
      UserCardHistory.create!(user_id: dave_id,
                              card_id: dabiao_id,
                              times_right: 0,
                              times_wrong: 0, times_right_since_last_mistake: 0, 
                              last_studied: Time.now)
      UserCardHistory.create!(user_id: dave_id,
                              card_id: pingguo_id,
                              times_right: 0,
                              times_wrong: 0, times_right_since_last_mistake: 0, 
                              last_studied: Time.now)
      UserCardHistory.create!(user_id: dave_id,
                              card_id: shafa_id,
                              times_right: 0,
                              times_wrong: 0, times_right_since_last_mistake: 0, 
                              last_studied: Time.now)
      UserCardHistory.create!(user_id: dave_id,
                              card_id: kate_id0,
                              times_right: 0,
                              times_wrong: 0, times_right_since_last_mistake: 0, 
                              last_studied: Time.now)
        UserCardHistory.create!(user_id: steve_id,
                                card_id: kate_id,
                                times_right: 0,
                                times_wrong: 0, times_right_since_last_mistake: 0, 
                                last_studied: Time.now)
        UserCardHistory.create!(user_id: steve_id,
                                card_id: gary_id,
                                times_right: 0,
                                times_wrong: 0, times_right_since_last_mistake: 0, 
                                last_studied: Time.now)
        UserCardHistory.create!(user_id: steve_id,
                                card_id: colin_id,
                                times_right: 0,
                                times_wrong: 0, times_right_since_last_mistake: 0, 
                                last_studied: Time.now)
        UserCardHistory.create!(user_id: steve_id,
                                card_id: dave_id,
                                times_right: 0,
                                times_wrong: 0, times_right_since_last_mistake: 0, 
                                last_studied: Time.now)
        UserCardHistory.create!(user_id: steve_id,
                                card_id: dave_id,
                                times_right: 0,
                                times_wrong: 0, times_right_since_last_mistake: 0, 
                                last_studied: Time.now)
        UserCardHistory.create!(user_id: steve_id,
                                card_id: dom_id,
                                times_right: 0,
                                times_wrong: 0, times_right_since_last_mistake: 0, 
                                last_studied: Time.now)
        UserCardHistory.create!(user_id: steve_id,
                                card_id: dabiao_id,
                                times_right: 0,
                                times_wrong: 0, times_right_since_last_mistake: 0, 
                                last_studied: Time.now)
          UserCardHistory.create!(user_id: dom_id,
                                  card_id: kate_id,
                                  times_right: 0,
                                  times_wrong: 0, times_right_since_last_mistake: 0, 
                                  last_studied: Time.now)
          UserCardHistory.create!(user_id: dom_id,
                                  card_id: gary_id,
                                  times_right: 0,
                                  times_wrong: 0, times_right_since_last_mistake: 0, 
                                  last_studied: Time.now)
          UserCardHistory.create!(user_id: dom_id,
                                  card_id: colin_id,
                                  times_right: 0,
                                  times_wrong: 0, times_right_since_last_mistake: 0, 
                                  last_studied: Time.now)
          UserCardHistory.create!(user_id: dom_id,
                                  card_id: dave_id,
                                  times_right: 0,
                                  times_wrong: 0, times_right_since_last_mistake: 0, 
                                  last_studied: Time.now)
          UserCardHistory.create!(user_id: dom_id,
                                  card_id: dave_id,
                                  times_right: 0,
                                  times_wrong: 0, times_right_since_last_mistake: 0, 
                                  last_studied: Time.now)
          UserCardHistory.create!(user_id: dom_id,
                                  card_id: dom_id,
                                  times_right: 0,
                                  times_wrong: 0, times_right_since_last_mistake: 0, 
                                  last_studied: Time.now)
          UserCardHistory.create!(user_id: dom_id,
                                  card_id: shafa_id,
                                  times_right: 0,
                                  times_wrong: 0, times_right_since_last_mistake: 0, 
                                  last_studied: Time.now)
          UserCardHistory.create!(user_id: dom_id,
                                  card_id: kate_id0,
                                  times_right: 0,
                                  times_wrong: 0, times_right_since_last_mistake: 0, 
                                  last_studied: Time.now)


100.times do
  url = ["https://www.filepicker.io/api/file/Di7mO5QQwO1kd7bg1N9U",
         "https://www.filepicker.io/api/file/RuChkLYuR0qR5kDJFm8D",
         "https://www.filepicker.io/api/file/8K351T2ETGGQALCIxOUh",
         "https://www.filepicker.io/api/file/ywbypgQxSMa0wrK3XR97",
         "https://www.filepicker.io/api/file/QA0ELA1TUux2KkIQyXWX"].sample

  User.create!( email: Faker::Internet.email,
                password: "password",
                username: Faker::Name.name,
                points: rand(1000),
                filepicker_url: url)
end









# scroll past
