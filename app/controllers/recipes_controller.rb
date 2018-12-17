class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    @recipe.ingredients_attributes = ingredients_params
    redirect_to recipe_path(@recipe)
  end

  def ingredients_params
    params.has_key?(:ingredients) ? params.require(:ingredients).permit(:ids => []) : {ids: []}
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[])
  end
end