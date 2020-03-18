class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true

  has_many :lunch_packages
  has_many :meals, through: :lunch_packages

  enum role: { admin: 1, common: 2 }

  validates :role, presence: true

  before_validation(on: :create) do
    self.role = 2
  end

  has_one :meal
end
