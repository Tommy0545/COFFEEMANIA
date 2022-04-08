# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]

  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインに成功しました。"
    root_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトに成功しました。"
    root_path
  end

  protected

  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
        flash[:error] = "退会済みです。再度会員登録をしてください。"
        redirect_to new_user_session_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end
end
