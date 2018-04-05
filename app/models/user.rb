class User < ApplicationRecord 
  rolify
  has_many :articles
    acts_as_authentic do |c|
      c.crypto_provider = Authlogic::CryptoProviders::BCrypt
      c.check_passwords_against_database = true
      c.crypted_password_field = :password_digest
  end
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
		    uniqueness: { case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: { minimum: 6}
end
