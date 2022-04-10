class BeanFavoritesController < ApplicationController
  def create
    @bean = Bean.find(params[:bean_id])
    bean_favorite = current_user.bean_favorites.new(bean_id: @bean.id)
    bean_favorite.save
    redirect_to bean_path(@bean)
  end

  def destroy
    @ean = Bean.find(params[:bean_id])
    bean_favorite = current_user.bean_favorites.find_by(bean_id: @bean.id)
    bean_favorite.destroy
    redirect_to bean_path(@bean)
  end
end
