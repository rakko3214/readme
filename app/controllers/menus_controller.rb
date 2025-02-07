class MenusController < ApplicationController
  skip_before_action :require_login, only: %i[index]

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
      recipe_ids = params[:menu][:recipe_ids] || []
      recipe_ids.reject(&:blank?).each do |recipe_id|
       recipe_ids_array << recipe_id
      end
      @menu.recipe_ids = recipe_ids_array

      redirect_to menus_path
    else
      render :new
    end
  end

  def show
    @menu = Menu.find(params[:id])
    @menus = Menu.includes(:user)
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      redirect_to menus_path(@menu)
    else
      render :edit
    end
  end

  def edit
    @menu = current_user.menus.find(params[:id])
    @search = Recipe.ransack(params[:q])
    @recipes = @search.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:title, recipe_ids: [])
  end
end
