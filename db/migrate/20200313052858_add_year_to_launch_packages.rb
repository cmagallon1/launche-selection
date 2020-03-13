class AddYearToLaunchPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :lunch_packages, :year, :string
  end
end
