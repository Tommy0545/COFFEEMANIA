class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
    @cafes=@user.cafes
    @beans=@user.beans
  end

  def index
    @@users = User.where.not(id: current_user.id)
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=current_user
    @user.update(user_params)
    flash[:notice]="Uupdate was successfully"
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

  def followings
    user = User.find(params[:id])
    @user = user.followings
  end

  def followers
    user = User.find(params[:id])
    @user = user.followers
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :profile_image, :introduction, :favorite_bean,:is_deleted)
  end
end
