FactoryGirl.define do
  factory :courses do
    title "Fruits and Veggies"
    category "Food Woods"
    author_id 1

    # sequence :card do
#       FactoryGirl.create(:card,
#         character: "苹果"
#         pinyin: "ping2guo2"
#         english: "apple")
#     end
  end
end