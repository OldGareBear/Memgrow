json.array! @courses do |course|
  json.id course.id
  json.title course.title
  json.category course.category
  json.author_id course.author_id
  json.filepicker_url course.filepicker_url
end
