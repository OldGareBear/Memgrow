class AddLastStudiedToUserCardHistory < ActiveRecord::Migration
  def change
    add_column :user_card_histories, :last_studied, :datetime
  end
end
