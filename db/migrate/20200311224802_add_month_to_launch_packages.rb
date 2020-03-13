class AddMonthToLaunchPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :lunch_packages, :month, :integer
  end
end
