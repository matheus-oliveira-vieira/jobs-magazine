class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.is_a?(User) && resource.administrator?
        new_company_path
    elsif resource.is_a?(User) && resource.candidate?
      edit_user_registration_path
    else  
      super
    end
  end
end