class CreateLunchPackages < ActiveRecord::Migration[6.0]
  def change
    create_table :lunch_packages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true
      t.integer :month
      t.integer :year
    end
  end
end
