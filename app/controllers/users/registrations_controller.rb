# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    flash[:asign] = "アカウント作成に成功しました。"
    root_path
  end

end