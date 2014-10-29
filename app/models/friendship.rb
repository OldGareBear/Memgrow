class Frienship < ActiveRecord::Base
  validates :requester_id, :requestee_id, presence: true

  belongs_to(
    :requester,
    class_name: "User",
    foreign_key: :requester_id,
    primary_key: :id,
    inverse_of: :subs
  )

  belongs_to(
    :requestee,
    class_name: "User",
    foreign_key: :requestee_id,
    primary_key: :id,
    inverse_of: :subs
  )
end
