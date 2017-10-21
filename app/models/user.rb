class User < ApplicationRecord
  attr_accessor :remember_token, :reset_token
  before_save :downcase_email
  before_create :generate_access_token

  validates :username, :email, :password_digest, presence: true
  validates :email, uniqueness: true
  has_many :restaurants
  has_many :reviews

  has_secure_password

    # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def self.authenticate(email, password)
      user = User.find_by(email: email)
      if user && user.password == password
        user
      else
        nil
      end
  end
  private

  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end

  def generate_access_token
    begin
      self.access_token = User.new_token
    end while self.class.exists?(access_token: access_token)
  end

end
