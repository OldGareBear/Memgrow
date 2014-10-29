class CreateUserCardHistories < ActiveRecord::Migration
  def change
    create_table :user_card_histories do |t|
      t.integer :user_id, null: false
      t.integer :card_id, null: false
      t.integer :times_right, default: 0
      t.integer :times_wrong, default: 0
      t.timestamps
    end

    add_index :user_card_histories, :user_id
    add_index :user_card_histories, :card_id
  end
end
