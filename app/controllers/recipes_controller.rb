class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @search = Recipe.ransack(params[:q])
    @recipes = @search.result(distinct: true).includes(:user).order(created_at: :desc)
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

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
    @comments = @recipe.comments.includes(:user).order(created_at: :desc)
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def edit
    @recipe = current_user.recipes.find(params[:id])
  end

  def favorites
    @favorite_recipes = current_user.favorite_recipes.includes(:user).order(created_at: :desc)
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :content, :cooking_time, :ingredient, :avatar, :avatar_cache,)
  end
end
