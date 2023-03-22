class ApplicationController < ActionController::Base
    include Pagy::Backend

    before_action :authenticate_user!

    layout :layout_by_resource
    protect_from_forgery with: :exception

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

    # def profile_params
    #     params.require(:profile).permit(:id)
    # end

    # protected

    # def configure_sign_up_params
    # #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    #     devise_parameter_sanitizer.permit(:sign_up, keys: permitted_attributes)
    # end
      
    # def configure_account_update_params
    #     devise_parameter_sanitizer.permit(:account_update, keys: permitted_attributes)
    # end
      
    # def permitted_attributes
    #     [
    #     :email,
    #     :password,
    #     :password_confirmation,
    #     :remember_me,
    #     :profile_image,
    #     profile_attributes: [:first_name, :last_name, :username, :id] 
    #     ]
    # end
end
