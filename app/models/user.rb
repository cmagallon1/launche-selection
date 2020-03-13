class User < ApplicationRecord

 validates :name, presence: true

 has_many :lunch_packages
 has_many :meals, through: :lunch_packages
end 
