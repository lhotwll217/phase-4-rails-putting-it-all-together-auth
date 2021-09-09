class RecipesController < ApplicationController

    def create
        
        recipe = Recipe.create(title: params[:title], instructions: params[:instructions], minutes_to_complete: params[:minutes_to_complete], user_id: session[:user_id])
            if recipe.valid?
                render json: recipe, status: :created
            else
                render json: {errors: recipe.errors.full_messages}, status: :unprocessable_entity
            end
        
    end

    def index 
        recipes = Recipe.find_by(user_id: session[:user_id])

        if recipes
            render json: recipes
        else
            render json: {errors: "Recipes not found"}, status: :not_found
        end
    end
    







    private
    # def recipe_params
    #     params.permit(:title, :instructions, :minutes_to_complete)
    # end
end
