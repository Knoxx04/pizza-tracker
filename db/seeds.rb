puts "destroying..."

Restaurant.destroy_all
Pizza.destroy_all
RestaurantPizza.destroy_all

puts "seeding..."
5.times do
    name = Faker::Name.name
    address= Faker::Address.full_address
    Restaurant.create(name:name, address:address)
    5.times do
      Pizza.create(
        name: Faker::Food.dish,
        ingredients: Faker::Food.ingredient
      )
    end
    5.times do
      # Create a random Restaurant and Pizza to associate
      restaurant = Restaurant.order("RANDOM()").first
      pizza = Pizza.order("RANDOM()").first
      # Create a new RestaurantPizza
      restaurant_pizza = RestaurantPizza.new(
        price: Faker::Commerce.price(range: 5..20.0, as_string: true),
        pizza_id: pizza.id,
        restaurant_id: restaurant.id
      )
      # Save the new RestaurantPizza to the database
      restaurant_pizza.save
    end
end

puts "done seeding"