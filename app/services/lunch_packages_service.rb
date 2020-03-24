class LunchPackagesService
  class << self 
    def update_package(meals, user)
      meals.size == 5 && update_meals(user, meals)
    end

    def update_meals(user, meals)
      package = ''
      LunchPackage.last_month_meals(user).each_with_index do |meal, i|
        package = meal.update(meal_id: meals[i])
        break unless package
      end
      package
    end

    def build_package(date, user, meals)
      valid_package?(meals, user, date) && save_package(meals, user, date)
    end 

    def valid_package?(meals, user, date)
      meals && meals.count == 5 && !already_package?(user, date)
    end

    def already_package?(user, date)
      user_meals = LunchPackage.where(user_id: user.id, month: date[:month], year: date[:year])
      !user_meals.empty?
    end

    def save_package(meals, user, date)
      data = meals.map { |meal| { meal_id: meal.to_i, month: date[:month].to_i, year: date[:year] } }
      user.lunch_packages.create(data)
    end
  end
end
