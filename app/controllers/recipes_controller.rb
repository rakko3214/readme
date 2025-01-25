class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipes_path, success: "レシピを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :content, :cooking_time, :ingredient)
  end
end
