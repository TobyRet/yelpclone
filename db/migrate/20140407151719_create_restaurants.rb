class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :loation
      t.string :category

      t.timestamps
    end
  end
end
