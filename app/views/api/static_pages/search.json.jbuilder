json.array! @results do |result|
  json.extract! result, :id, :username, :email, :filepicker_url, :points
end
