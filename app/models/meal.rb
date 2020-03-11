class Meal < ApplicationRecord
 has_many :launch_packages
 has_many :users, through: :launch_packages
end 
