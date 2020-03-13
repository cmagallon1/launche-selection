class Meal < ApplicationRecord
 
 validates :meal_name, presence: true
 validates :image, presence: true

 has_many :lunch_packages
 has_many :users, through: :lunch_packages
end 
