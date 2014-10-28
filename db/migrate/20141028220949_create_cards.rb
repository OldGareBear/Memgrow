class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :course_id, null: false
      t.string :character
      t.string :pinyin
      t.string :english
      
      t.timestamps
    end
  end
end
