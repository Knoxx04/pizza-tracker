class CreateRestaurantPizzas < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurant_pizzas do |t|
      t.string :name
      t.text :ingredients

      t.timestamps
    end
  end
end
