class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_q_for_post
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_q_for_post
    @q = Recipe.ransack(params[:q])
  end

  def autocomplete
    @q = Recipe.ransack(params[:q])
    @examples = @q.result(distinct: true).limit(10)
  
    render json: @examples.as_json(only: [:id, :title, :decription])
  end

  private

  def configure_permitted_parameters
    # /users/sign_up
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name ])
  end

  def not_authenticated
    redirect_to login_path
  end
end
