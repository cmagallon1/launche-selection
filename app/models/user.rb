class User < ApplicationRecord

 validates :name, presence: true

 has_many :launch_packages
 has_many :meals, through: :launch_packages
end 
