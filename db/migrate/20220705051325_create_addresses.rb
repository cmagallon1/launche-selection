class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.references :state, null: false, foreign_key: true
      t.string :postal_code

      t.timestamps
    end
  end
end
