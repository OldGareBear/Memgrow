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
User.create!( email: "gary@gary.com",
              password: "password",
              username: "Gary",
              points: 1000,
              filepicker_url: "https://www.filepicker.io/api/file/QA0ELA1TUux2KkIQyXWX")
User.create!( email: "colin@colin.colin",
              password: "password",
              username: "Colin",
              points: 995,
              filepicker_url: "https://www.filepicker.io/api/file/ywbypgQxSMa0wrK3XR97")
User.create!( email: "dave@dave.com",
              password: "password",
              username: "Dave",
              points: 437,
              filepicker_url: "https://www.filepicker.io/api/file/8K351T2ETGGQALCIxOUh")
User.create!( email: "steve@steve.com",
              password: "password",
              username: "Steve",
              points: 762,
              filepicker_url: "https://www.filepicker.io/api/file/RuChkLYuR0qR5kDJFm8D")
User.create!( email: "dom@dom.com",
              password: "password",
              username: "Dom",
              points: 11,
              filepicker_url: "https://www.filepicker.io/api/file/QA0ELA1TUux2KkIQyXWX")

Friendship.create!( requester_id: 1,
                    requestee_id: 2,
                    status: "accepted")
Friendship.create!( requester_id: 2,
                    requestee_id: 3,
                    status: "accepted")
Friendship.create!( requester_id: 3,
                    requestee_id: 4,
                    status: "accepted")
Friendship.create!( requester_id: 4,
                    requestee_id: 5,
                    status: "accepted")
Friendship.create!( requester_id: 5,
                    requestee_id: 6,
                    status: "accepted")
Friendship.create!( requester_id: 4,
                    requestee_id: 2,
                    status: "accepted")
Friendship.create!( requester_id: 3,
                    requestee_id: 5,
                    status: "accepted")
Friendship.create!( requester_id: 4,
                    requestee_id: 6,
                    status: "accepted")
Friendship.create!( requester_id: 1,
                    requestee_id: 3,
                    status: "accepted")
Friendship.create!( requester_id: 4,
                    requestee_id: 1,
                    status: "accepted")
Friendship.create!( requester_id: 5,
                    requestee_id: 2,
                    status: "accepted")
Friendship.create!( requester_id: 6,
                    requestee_id: 3,
                    status: "accepted")
Friendship.create!( requester_id: 2,
                    requestee_id: 6,
                    status: "accepted")
Friendship.create!( requester_id: 1,
                    requestee_id: 5,
                    status: "accepted")
Friendship.create!( requester_id: 1,
                    requestee_id: 6,
                    status: "accepted")
Friendship.create!( requester_id: 50,
                    requestee_id: 4,
                    status: "pending")
Friendship.create!( requester_id: 51,
                    requestee_id: 4,
                    status: "pending")
Friendship.create!( requester_id: 52,
                    requestee_id: 4,
                    status: "pending")

Course.create!( title: "Fruits and Veggies",
  category: "Food",
  author_id: 1,
  filepicker_url: "https://www.filepicker.io/api/file/geiPbl4ATeKTvHlrbDXP" )
Course.create!( title: "Meats",
  category: "Food",
  author_id: 2,
  filepicker_url: "https://www.filepicker.io/api/file/geiPbl4ATeKTvHlrbDXP" )
Course.create!( title: "Taking Taxies",
  category: "Transportation",
  author_id: 1,
  filepicker_url: "https://www.filepicker.io/api/file/geiPbl4ATeKTvHlrbDXP" )
Course.create!( title: "Furniture",
  category: "Around the House",
  author_id: 3,
  filepicker_url: "https://www.filepicker.io/api/file/geiPbl4ATeKTvHlrbDXP" )


Card.create!( course_id: "1",
  character: "苹果",
  pinyin: "pingguo",
  english: "apple" )

Card.create!( course_id: "1",
  character: "南瓜",
  pinyin: "nangua",
  english: "pumkin" )

Card.create!( course_id: "1",
  character: "李",
  pinyin: "li",
  english: "pear" )

Card.create!( course_id: "2",
  character: "牛肉",
  pinyin: "niurou",
  english: "beef" )

Card.create!( course_id: "2",
  character: "鱼",
  pinyin: "yu",
  english: "fish" )

Card.create!( course_id: "2",
  character: "猪肉",
  pinyin: "zhurou",
  english: "pork" )

Card.create!( course_id: "3",
  character: "打表",
  pinyin: "dabiao",
  english: "use the meter" )

Card.create!( course_id: "3",
  character: "北京大学西南门儿",
  pinyin: "pingguo",
  english: "apple" )

Card.create!( course_id: "4",
  character: "沙发",
  pinyin: "shafa",
  english: "sofa" )

Card.create!( course_id: "4",
  character: "椅子",
  pinyin: "yizi",
  english: "chair" )

Enrollment.create!(user_id: 1, course_id: 1)
Enrollment.create!(user_id: 1, course_id: 2)
Enrollment.create!(user_id: 1, course_id: 3)
Enrollment.create!(user_id: 2, course_id: 4)
Enrollment.create!(user_id: 2, course_id: 1)
Enrollment.create!(user_id: 2, course_id: 2)
Enrollment.create!(user_id: 3, course_id: 3)
Enrollment.create!(user_id: 3, course_id: 4)
Enrollment.create!(user_id: 3, course_id: 1)
Enrollment.create!(user_id: 4, course_id: 2)
Enrollment.create!(user_id: 4, course_id: 3)
Enrollment.create!(user_id: 4, course_id: 4)
Enrollment.create!(user_id: 5, course_id: 1)
Enrollment.create!(user_id: 5, course_id: 2)
Enrollment.create!(user_id: 5, course_id: 3)
Enrollment.create!(user_id: 6, course_id: 4)
Enrollment.create!(user_id: 6, course_id: 1)
Enrollment.create!(user_id: 6, course_id: 2)

UserCardHistory.create!(user_id: 1,
                        card_id: 1,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
UserCardHistory.create!(user_id: 1,
                        card_id: 2,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
UserCardHistory.create!(user_id: 1,
                        card_id: 3,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
UserCardHistory.create!(user_id: 1,
                        card_id: 4,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
UserCardHistory.create!(user_id: 1,
                        card_id: 4,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
UserCardHistory.create!(user_id: 1,
                        card_id: 6,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
UserCardHistory.create!(user_id: 1,
                        card_id: 7,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
UserCardHistory.create!(user_id: 1,
                        card_id: 8,
                        times_right: 0,
                        times_wrong: 0, times_right_since_last_mistake: 0, 
                        last_studied: Time.now)
  UserCardHistory.create!(user_id: 2,
                          card_id: 1,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
  UserCardHistory.create!(user_id: 2,
                          card_id: 2,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
  UserCardHistory.create!(user_id: 2,
                          card_id: 3,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
  UserCardHistory.create!(user_id: 2,
                          card_id: 4,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
  UserCardHistory.create!(user_id: 2,
                          card_id: 4,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
  UserCardHistory.create!(user_id: 2,
                          card_id: 6,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
  UserCardHistory.create!(user_id: 2,
                          card_id: 9,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
  UserCardHistory.create!(user_id: 2,
                          card_id: 10,
                          times_right: 0,
                          times_wrong: 0, times_right_since_last_mistake: 0, 
                          last_studied: Time.now)
    UserCardHistory.create!(user_id: 3,
                            card_id: 1,
                            times_right: 0,
                            times_wrong: 0, times_right_since_last_mistake: 0, 
                            last_studied: Time.now)
    UserCardHistory.create!(user_id: 3,
                            card_id: 2,
                            times_right: 0,
                            times_wrong: 0, times_right_since_last_mistake: 0, 
                            last_studied: Time.now)
    UserCardHistory.create!(user_id: 3,
                            card_id: 3,
                            times_right: 0,
                            times_wrong: 0, times_right_since_last_mistake: 0, 
                            last_studied: Time.now)
    UserCardHistory.create!(user_id: 3,
                            card_id: 7,
                            times_right: 0,
                            times_wrong: 0, times_right_since_last_mistake: 0, 
                            last_studied: Time.now)
    UserCardHistory.create!(user_id: 3,
                            card_id: 8,
                            times_right: 0,
                            times_wrong: 0, times_right_since_last_mistake: 0, 
                            last_studied: Time.now)
    UserCardHistory.create!(user_id: 3,
                            card_id: 9,
                            times_right: 0,
                            times_wrong: 0, times_right_since_last_mistake: 0, 
                            last_studied: Time.now)
    UserCardHistory.create!(user_id: 3,
                            card_id: 10,
                            times_right: 0,
                            times_wrong: 0, times_right_since_last_mistake: 0, 
                            last_studied: Time.now)
      UserCardHistory.create!(user_id: 4,
                              card_id: 4,
                              times_right: 0,
                              times_wrong: 0, times_right_since_last_mistake: 0, 
                              last_studied: Time.now)
      UserCardHistory.create!(user_id: 4,
                              card_id: 5,
                              times_right: 0,
                              times_wrong: 0, times_right_since_last_mistake: 0, 
                              last_studied: Time.now)
      UserCardHistory.create!(user_id: 4,
                              card_id: 6,
                              times_right: 0,
                              times_wrong: 0, times_right_since_last_mistake: 0, 
                              last_studied: Time.now)
      UserCardHistory.create!(user_id: 4,
                              card_id: 7,
                              times_right: 0,
                              times_wrong: 0, times_right_since_last_mistake: 0, 
                              last_studied: Time.now)
      UserCardHistory.create!(user_id: 4,
                              card_id: 8,
                              times_right: 0,
                              times_wrong: 0, times_right_since_last_mistake: 0, 
                              last_studied: Time.now)
      UserCardHistory.create!(user_id: 4,
                              card_id: 9,
                              times_right: 0,
                              times_wrong: 0, times_right_since_last_mistake: 0, 
                              last_studied: Time.now)
      UserCardHistory.create!(user_id: 4,
                              card_id: 10,
                              times_right: 0,
                              times_wrong: 0, times_right_since_last_mistake: 0, 
                              last_studied: Time.now)
        UserCardHistory.create!(user_id: 5,
                                card_id: 1,
                                times_right: 0,
                                times_wrong: 0, times_right_since_last_mistake: 0, 
                                last_studied: Time.now)
        UserCardHistory.create!(user_id: 5,
                                card_id: 2,
                                times_right: 0,
                                times_wrong: 0, times_right_since_last_mistake: 0, 
                                last_studied: Time.now)
        UserCardHistory.create!(user_id: 5,
                                card_id: 3,
                                times_right: 0,
                                times_wrong: 0, times_right_since_last_mistake: 0, 
                                last_studied: Time.now)
        UserCardHistory.create!(user_id: 5,
                                card_id: 4,
                                times_right: 0,
                                times_wrong: 0, times_right_since_last_mistake: 0, 
                                last_studied: Time.now)
        UserCardHistory.create!(user_id: 5,
                                card_id: 4,
                                times_right: 0,
                                times_wrong: 0, times_right_since_last_mistake: 0, 
                                last_studied: Time.now)
        UserCardHistory.create!(user_id: 5,
                                card_id: 6,
                                times_right: 0,
                                times_wrong: 0, times_right_since_last_mistake: 0, 
                                last_studied: Time.now)
        UserCardHistory.create!(user_id: 5,
                                card_id: 7,
                                times_right: 0,
                                times_wrong: 0, times_right_since_last_mistake: 0, 
                                last_studied: Time.now)
          UserCardHistory.create!(user_id: 6,
                                  card_id: 1,
                                  times_right: 0,
                                  times_wrong: 0, times_right_since_last_mistake: 0, 
                                  last_studied: Time.now)
          UserCardHistory.create!(user_id: 6,
                                  card_id: 2,
                                  times_right: 0,
                                  times_wrong: 0, times_right_since_last_mistake: 0, 
                                  last_studied: Time.now)
          UserCardHistory.create!(user_id: 6,
                                  card_id: 3,
                                  times_right: 0,
                                  times_wrong: 0, times_right_since_last_mistake: 0, 
                                  last_studied: Time.now)
          UserCardHistory.create!(user_id: 6,
                                  card_id: 4,
                                  times_right: 0,
                                  times_wrong: 0, times_right_since_last_mistake: 0, 
                                  last_studied: Time.now)
          UserCardHistory.create!(user_id: 6,
                                  card_id: 4,
                                  times_right: 0,
                                  times_wrong: 0, times_right_since_last_mistake: 0, 
                                  last_studied: Time.now)
          UserCardHistory.create!(user_id: 6,
                                  card_id: 6,
                                  times_right: 0,
                                  times_wrong: 0, times_right_since_last_mistake: 0, 
                                  last_studied: Time.now)
          UserCardHistory.create!(user_id: 6,
                                  card_id: 9,
                                  times_right: 0,
                                  times_wrong: 0, times_right_since_last_mistake: 0, 
                                  last_studied: Time.now)
          UserCardHistory.create!(user_id: 6,
                                  card_id: 10,
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
                points: 1000,
                filepicker_url: url)
end









# scroll past
