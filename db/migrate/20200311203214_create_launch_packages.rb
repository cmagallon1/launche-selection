class CreateLaunchPackages < ActiveRecord::Migration[6.0]
  def change
    create_table :launch_packages do |t|
      t.belongs_to :user
      t.belongs_to :meal

    end
  end
end
