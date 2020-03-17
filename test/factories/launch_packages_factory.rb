
FactoryBot.define do 
  factory :lunch_package do
    user_id { User.all.sample.id }
    month { LunchPackage.months.values.sample  }
    meal_id { Meal.all.sample.id  }
  end
end
