require 'faker'

FactoryBot.define do 
  factory :meal do
    meal_name { Faker::Food.dish }
    image { 'https://sevilla.abc.es/gurme/wp-content/uploads/sites/24/2012/01/comida-rapida-casera.jpg' }
  end
end
