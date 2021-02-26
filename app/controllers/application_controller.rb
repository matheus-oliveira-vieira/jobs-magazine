class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :role)
    end
  end
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if resource.company.nil?
        new_company_path
      end
    else
      super
    end
  end
end
