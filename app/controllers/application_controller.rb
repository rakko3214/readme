class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_q_for_post
  before_action :require_login

  def set_q_for_post
    @q = Recipe.ransack(params[:q])
  end

  private

  def not_authenticated
    redirect_to login_path
  end
end
