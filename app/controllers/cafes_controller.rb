class CafesController < ApplicationController

  def new
    @cafe=Cafe.new
  end

  def create
    @cafe=Cafe.new(cafe_params)
    @cafe.user_id=current_user.id
    @cafe.save
    redirect_to cafes_path
  end

  def index
    @cafe=Cafe.all
  end

  def show
    @cafe=Cafe.find(params[:id])
  end

  def edit
    @cafe=Cafe.find(params[:id])
  end

  def update
    @cafe=Cafe.find(params[:id])
    @cafe.update(cafe_params)
    redirect_to cafe_path(@cafe.id)
  end

  def destroy
    @cafe=Cafe.find(params[:id])
    @cafe.destroy
    redirect_to cafes_path
  end

  private

  def cafe_params
    params.require(:cafe).permit(:image, :store_name, :location, :introduction, :site_url)
  end
end
