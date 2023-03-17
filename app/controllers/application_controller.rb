class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    layout :layout_by_resource
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    # redirect user to login page after signout
    def after_sign_out_path_for(resource_or_scope)
        new_user_session_path
    end

    private

    # if directed to view managed by devise (login), render that layout, not application
    def layout_by_resource
        if devise_controller?
        "devise"
        else
        "application"
        end
    end

    protected

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :profile_image])
    end
end
