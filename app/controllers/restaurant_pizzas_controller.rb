class RestaurantPizzasController < ApplicationController
    def create
        restaurant_pizza = RestaurantPizza.create(res_piz_params)
        if restaurant_pizza.valid?
            render json: Pizza.find(params[:pizza_id])
        else
            render json: {errors: restaurant_pizza.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def res_piz_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end

end
