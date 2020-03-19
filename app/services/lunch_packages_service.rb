class LunchPackagesService

  def update_package(meals, user)
    if valid_package?(meals, user)
      update_meals(user, meals)
    end
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
   res = valid_package?(meals, user)
   res ? save_package(meals, user, date) : res
  end 

  def valid_package?(meals, user)
    if meals 
      meals.count == 5 && !already_package?(user, meals)
    end 
  end

  def already_package?(user, meals)
    user_meals = LunchPackage.user_meals(user, meals)
    false if user_meals.empty? || user_meals.all? { |i| meals.include?(i) }
  end

  def save_package(meals, user, date)
    data = meals.map { |meal| { meal_id: meal.to_i, month: date[:month].to_i, year: date[:year] } }
    user.lunch_packages.create(data)
  end
end
