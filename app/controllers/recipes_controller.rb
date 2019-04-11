class RecipesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @recipe=current_user.recipes.order("created_at DESC").paginate(page: params[:page], :per_page=>2)

  end

  def new
    @button = "Crear"
    @recipe = current_user.recipes.build

  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end

  end

  def edit
    @button = "Modificar"
    @recipe = Recipe.find(params[:id])


  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:notice] = "Receta modificada correctamente"
      redirect_to @recipe
    else
      render 'edit'
    end

  end

  def destroy

    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to action: "index", notice: "Receta eliminada correctamente"

  end

  def show
    @recipe = Recipe.find(params[:id])

  end

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :elaboration, :user_id)

  end

  def correct_user
    @recipe = current_user.recipes.find_by(id: params[:id])
    redirect_to recipe_path, notice: "No esta autorizado a editar este articulo" if @recipe.nil?
  end
end
