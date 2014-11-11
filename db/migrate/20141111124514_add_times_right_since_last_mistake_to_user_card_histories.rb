class AddTimesRightSinceLastMistakeToUserCardHistories < ActiveRecord::Migration
  def change
    add_column :user_card_histories, :times_right_since_last_mistake, :integer, default: 0
  end
end
