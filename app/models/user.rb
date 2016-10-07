class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user
    if user.is_password?(password)
      return user
    else
      nil 
    end
  end

  def reset_session_token!
    self.session_token=User.generate_session_token
    self.save
  end

  def ensure_session_token
    self.session_token||= User.generate_session_token
  end

  def password=(password)
    self.password_digest=BCrypt::Password.create(password)
  end

  def is_password?(password)
    pass = BCrypt::Password.new(self.password_digest)
    pass.is_password?(password)
  end

end
