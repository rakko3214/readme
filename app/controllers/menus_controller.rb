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
      redirect_to menus_path, notice: 'メニューが登録されました'
    else
      render :new
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:title, recipe_id: [])
  end
end
