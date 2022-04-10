class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
    @cafes=@user.cafes
    @beans=@user.beans
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=current_user
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def unsubscribe
    @user=User.find(params[:id])
  end

  def withdrawal
    @user=User.find(params[:id])
    @user.update(is_deleted: true)
    @user.beans.destroy_all
    @user.cafes.destroy_all
    @user.bean_comments.destroy_all
    @user.cafe_comments.destroy_all
    @user.bean_favorites.destroy_all
    @user.cafe_favorites.destroy_all
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :profile_image, :introduction, :favorite_bean,:is_deleted)
  end
end
