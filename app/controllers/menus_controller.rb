class MenusController < ApplicationController
  def index
    @menus = Menu.includes(:user)
  end

  def new
    @menu = Menu.new
    @search = Recipe.ransack(params[:q])
    @recipes = @search.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def create
    @menu = current_user.menus.build(menu_params)
    if @menu.save
      recipe_ids_array = []
      params[:menu][:recipe_ids].reject(&:blank?).each do |recipe_id|
        recipe_ids_array << recipe_id
      end
      @menu.recipe_ids = recipe_ids_array

      redirect_to menus_path, notice: "メニューが登録されました"
    else
      render :new
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:title, recipe_ids: [])
  end
end
