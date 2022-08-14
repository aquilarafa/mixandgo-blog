class User < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :email,
            format: {
              with: URI::MailTo::EMAIL_REGEXP
            },
            presence: true,
            uniqueness: true

  validates :password, presence: true

  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end
end
