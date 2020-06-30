class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP  }

  has_many :lunch_packages
  has_many :meals, through: :lunch_packages

  enum role: { common: 1, admin: 2 }

  validates :role, presence: true

  before_validation(on: :create) do
    self.role = 1
  end

end
