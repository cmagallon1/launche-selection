class LunchPackagesService
  class << self 
    def update_package(data)
      data[:meals].size == 5 && update_meals(data)
    end

    def update_meals(data)
      LunchPackage.transaction do 
        LunchPackage.last_month_meals(data[:user]).each_with_index do |meal, i|
          meal.update!(meal_id: data[:meals][i])
        end
      end
    end

    def build_package(data)
      meals = data[:meals]
      (meals && meals.count == 5 && !already_package?(data)) && save_package(data)
    end 

    def already_package?(data)
      date = data[:date]
      user = data[:user]
      LunchPackage.where(user_id: user.id, month: date[:month], year: date[:year]).any?
    end

    def save_package(data)
      meals = data[:meals]
      date = data[:date]
      user = data[:user]
      data = meals.map { |meal| { meal_id: meal.to_i, month: date[:month].to_i, year: date[:year] } }
      user.lunch_packages.create(data)
    end
  end
end
