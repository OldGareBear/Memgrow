class AddOmniIdColToUsers < ActiveRecord::Migration
  def change
    add_column :users, :omniauth_id, :string
  end
end
