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

  def edit
    @recipe = current_user.recipes.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :content, :cooking_time, :ingredient, :avatar)
  end
end
