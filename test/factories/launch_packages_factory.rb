
FactoryBot.define do 
  factory :launch_package do
    user_id { User.all.sample.id }
    month { LaunchPackage.months.values.sample  }
    meal_id { Meal.all.sample.id  }
  end
end
