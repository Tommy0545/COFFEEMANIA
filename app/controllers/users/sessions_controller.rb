# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]

  def after_sign_in_path_for(resource)
    flash[:notice] = "Login was successful."
    root_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "Log out was successful."
    new_user_session_path
  end

  protected

  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
        flash[:error] = "You have been unsubscribed. Please register as a member again."
        redirect_to new_user_session_path
      end
    else
      flash[:error] = "Please fill in the required fields."
    end
  end
end
