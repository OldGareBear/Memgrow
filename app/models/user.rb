class User < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_username_and_email,
                  against: [:username, :email],
                  :using => {
                    :tsearch => {:prefix => true}
                  }

  validates :email, :password_digest, :session_token, presence: true

  after_initialize :ensure_session_token

  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :user_card_histories, dependent: :destroy
  has_many :cards, through: :user_card_histories
  has_many :comments

  has_many(
    :sought_friendships,
    class_name: "Friendship",
    foreign_key: :requester_id,
    primary_key: :id,
  )
  
  has_many(
    :friend_requests,
    class_name: "Friendship",
    foreign_key: :requestee_id,
    primary_key: :id,
  )

  has_many :pending_requested_friendships, 
    -> { where status: 'pending' }, 
    through: :sought_friendships, 
    class_name: "Friendship", 
    source: :requester
  has_many :requested_friendships, 
    -> { where status: 'accepted' }, 
    through: :sought_friendships, 
    class_name: "Friendship", 
    source: :requester
  
  has_many :friendships_awaiting_acceptance, 
    -> { where status: 'pending' }, 
    through: :friend_requests, 
    class_name: "Friendship", 
    source: :requestee
  has_many :accepted_friendships, 
    -> { where status: 'accepted' }, 
    through: :friend_requests, 
    class_name: "Friendship", 
    source: :requestee
    
  has_many :pending_requested_friends, through: :pending_requested_friendships, source: :requester
  
  has_many :requested_friends, through: :requested_friendships, source: :requester
  
  has_many :friends_awaiting_acceptance, through: :friendships_awaiting_acceptance, source: :requestee
  
  has_many :accepted_friends, through: :accepted_friendships, source: :requestee
  
  attr_reader :password

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil unless user && user.valid_password?(password)
    user
  end

  def self.find_or_create_by_fb_auth_hash(auth)
    omniauth_id = auth['uid'] + auth['provider']
    user = User.find_by_omniauth_id(omniauth_id)
    return user if user

    fake_name = auth["info"].name
    fake_email = fake_name + "@"
    user = User.create!(omniauth_id: omniauth_id,
                        email: fake_email,
                        password: omniauth_id,
                        username: fake_name)
    return user
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

  def friends
    requested_friends + accepted_friends
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
