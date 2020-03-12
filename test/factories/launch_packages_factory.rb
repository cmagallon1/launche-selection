
FactoryBot.define do 
  factory :launch_package do
    user_id { User.all.sample.id }
    month { rand(12) + 1  }
    meal_id { Meal.all.sample.id  }
  end
end
