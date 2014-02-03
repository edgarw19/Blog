class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :username, :remember_token
  
  attr_accessor :password
  before_save :create_remember_token
  before_save :encrypt_password
  before_save { self.email = email.downcase}
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates :email, presence: true, format: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i,
  uniqueness: { case_sensitive: false}
  validates :username, presence:true, uniqueness: {case_sensitive: false}
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end