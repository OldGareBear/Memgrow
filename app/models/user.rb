class User < ActiveRecord::Base
  validates :email, :password, :session_token, presence: true
  
  after_initialize :ensure_session_token
  
  attr_reader :password
  
  def self.find_by_credentials(email, password)
    user = User.find_by_email(email) 
    return nil unless user && user.valid_password?(password)
    user
  end
  
  def self.generate_session_token!
    self.session_token = SecureRandom.urlsafe_base64
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt.create(password)
  end
  
  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def reset_token!
    self.class.generate_session_token
  end
  
  private
  
  def ensure_session_token
    self.session_token ||= self.generate_session_token!
  end
end
