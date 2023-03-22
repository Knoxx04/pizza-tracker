class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    

    def index
        restaurants = Restaurant.all 
        render json: restaurants.as_json(except: :pizzas)
    end

    def show
        restaurant = Restaurant.includes(:pizzas).find(params[:id])
        render json: restaurant, include: :pizzas
    end

    def destroy
        restaurant = Restaurant.find(params[:id])
        restaurant.destroy
        head:no_content
    end

    def render_not_found_response
        render json: { error: "Restaurant not found" }, status: :not_found
      end
    end
