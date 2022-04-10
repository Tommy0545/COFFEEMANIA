class CafeFavoritesController < ApplicationController
  def create
    @cafe = Cafe.find(params[:cafe_id])
    cafe_favorite = current_user.cafe_favorites.new(cafe_id: @cafe.id)
    cafe_favorite.save
    redirect_to cafe_path(@cafe)
  end

  def destroy
    @cafe = Cafe.find(params[:cafe_id])
    cafe_favorite = current_user.cafe_favorites.find_by(cafe_id: @cafe.id)
    cafe_favorite.destroy
    redirect_to cafe_path(@cafe)
  end
end
