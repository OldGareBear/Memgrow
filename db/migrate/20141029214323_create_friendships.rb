class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :requester_id, null: false
      t.integer :requestee_id, null: false
      t.string :status, default: "pending"

      t.timestamps
    end

    add_index :friendships, :requester_id
    add_index :friendships, :requestee_id
  end
end
