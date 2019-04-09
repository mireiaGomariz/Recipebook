class RecipesController < ApplicationController
  def index
    @recipe=Recipe.all
  end

  def new
    @button = "Crear"
    @recipe = Recipe.new

  end

  def create
    @recipe = Recipe.new(recipe_params)
    binding.pry
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end

  end

  def edit

  end

  def update

  end

  def delete

  end

  def show
    @recipe = Recipe.find(params[:id])

  end

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :elaboration, :user_id)

  end
end
