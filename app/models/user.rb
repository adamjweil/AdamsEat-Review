class User < ApplicationRecord
  validates :username, :email, :password_digest, presence: true
  validates :email, uniqueness: true
  has_many :restaurants
  has_many :reviews

  has_secure_password

  def self.authenticate(email, password)
      user = User.find_by(email: email)
      if user && user.password == password
        user
      else
        nil
      end
  end
end
