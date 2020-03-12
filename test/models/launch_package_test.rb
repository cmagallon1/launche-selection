require 'test_helper'

class LaunchPackageTest < ActiveSupport::TestCase
  
  def test_save_launch_package_without_params
    package = LaunchPackage.new
    assert_not package.save
  end

  def test_save_launch_package_record
    create(:user)
    create(:meal)
    assert create(:launch_package)
  end

  def test_obtain_meal_data_by_package_record
    create(:user)
    create(:meal)
    create(:launch_package)
    assert LaunchPackage.all.sample.meal 
  end

  def test_obtain_user_data_by_package_record
    create(:user)
    create(:meal)
    create(:launch_package)
    assert LaunchPackage.all.sample.user 
  end
end
