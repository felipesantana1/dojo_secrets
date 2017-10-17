class User < ActiveRecord::Base

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, presence: true
  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :liked_secrets, source: :secrets

  after_validation :downcase_email

  has_secure_password
  
  private
    def downcase_email
      self.email.downcase!
    end

  
end
