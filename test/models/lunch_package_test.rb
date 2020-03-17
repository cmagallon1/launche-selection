require 'test_helper'

class LunchPackageTest < ActiveSupport::TestCase
  
  def test_save_lunch_package_without_params
    package = LunchPackage.new
    assert_not package.save
  end

  def test_save_lunch_package_record
    user = create(:user)
    meal = create(:meal)
    package = build(:lunch_package, user: user, meal: meal)
    assert package.valid?
  end

  def test_save_lunch_without_user
    meal = create(:meal)
    package = build(:lunch_package, meal: meal, user: nil, month: LunchPackage.months.values.sample)
    assert_not package.valid?
  end

  def test_save_lunch_without_meal_id
    user = create(:user)
    package = build(:lunch_package, meal: nil, user: user, month: LunchPackage.months.values.sample)
    assert_not package.valid?
  end

  def test_save_lunch_withouth_month
    user = create(:user)
    meal = create(:meal)
    package = build(:lunch_package, user:user, meal: meal, month: nil)
    assert_not package.valid?
  end
end
