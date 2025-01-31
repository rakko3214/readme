class FavoritesController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.favorite(recipe)
    redirect_to recipes_path
  end

  def destroy
    recipe = current_user.favorites.find(params[:id]).recipe
    current_user.unfavorites(recipe)
    redirect_to recipes_path, status: :see_other
  end
end
