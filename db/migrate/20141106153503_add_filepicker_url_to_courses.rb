class AddFilepickerUrlToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :filepicker_url, :string
  end
end
