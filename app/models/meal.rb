class Meal < ApplicationRecord
 
 validates :meal_name, presence: true
 validates :image, presence: true

 has_many :launch_packages
 has_many :users, through: :launch_packages
end 
