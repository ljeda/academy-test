class RegistrationsController < Devise::RegistrationsController
    before_filter :configure_permitted_parameters

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :age, :city_id, :email, :password, :password_confirmation) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :age, :city_id, :email, :password, :password_confirmation, :current_password) }
        end
end