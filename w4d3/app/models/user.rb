class User < ActiveRecord::Base
  validates :user_name, :password_digest, :session_token, presence:true
  validates :user_name, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_reader :password, :email

  after_initialize :ensure_session_token

  has_many :cats

  def email=(email)
    @email = email
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    bc_obj = BCrypt::Password.new(self.password_digest)
    bc_obj.is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end
end
