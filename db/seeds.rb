# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([ name: 'Chicago' ,  name: 'Copenhagen' ])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!( email: "kate@kate.com", password: "password" )
User.create!( email: "gary@gary.com", password: "password" )
User.create!( email: "colin@colin.colin", password: "password" )
User.create!( email: "dave@dave.com", password: "password" )
User.create!( email: "steve@steve.com", password: "password" )
User.create!( email: "dom@dom.com", password: "password" )


Course.create!( title: "Fruits and Veggies",
  category: "Food",
  author_id: 1 )
Course.create!( title: "Meats",
  category: "Food",
  author_id: 2 )
Course.create!( title: "Taking Taxies",
  category: "Transportation",
  author_id: 1 )
Course.create!( title: "Furniture",
  category: "Around the House",
  author_id: 3 )


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