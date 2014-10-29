class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true

  after_initialize :ensure_session_token

  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :user_card_histories, dependent: :destroy
  has_many :cards, through: :user_card_histories

  has_many(
    :friendships,
    class_name: "Friendship",
    foreign_key: :requester_id,
    primary_key: :id,
    inverse_of: :requester
  )

  has_many(
    :friendships,
    class_name: "Friendship",
    foreign_key: :requestee_id,
    primary_key: :id,
    inverse_of: :requestee
  )

  has_many :friends, through: :friendships

  attr_reader :password

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil unless user && user.valid_password?(password)
    user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
