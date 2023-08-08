class User < ApplicationRecord
  validates :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: {minimum: 8, allow_nil: true}


  after_initialize :ensure_session_token

  attr_reader :password

  # Class methods
  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user
    return user if user.is_password?(password)
    nil
  end

  # Instance methods
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  # Setter method for password
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  # Generates a new session token for the user
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save
    self.session_token
  end

  private

  # Generates a session token for the user if one does not exist
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

end
