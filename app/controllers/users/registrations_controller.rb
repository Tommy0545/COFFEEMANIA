# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
before_action :configure_sign_up_params, if: :devise_controller?

def after_sign_up_path_for(resource)
    flash[:notice] = "新規登録に成功しました。"
    root_path
end





def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name,
                                                       :email,
                                                       :password
                                                      ])
end

end