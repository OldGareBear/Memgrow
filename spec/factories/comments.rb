FactoryGirl.define do
  factory :comment, :class => 'Comments' do
    author_id 1
course_id 1
content "MyText"
  end

end
