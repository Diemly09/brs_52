class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
  before_action :authenticate_user!, :set_locale, :load_search

  include ApplicationHelper

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit :name, :email, :password, :password_confirmation
    end
  end

  def default_url_options options = {}
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def load_search
    @search = Book.search params[:q]
  end
end
