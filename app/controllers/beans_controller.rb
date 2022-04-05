class BeansController < ApplicationController
  def new
    @bean=Bean.new
  end

  def create
    @bean=Bean.new(bean_params)
    @bean.user_id=current_user.id
    @bean.save
    redirect_to beans_path
  end

  def index
    @beans=Bean.all
  end

  def show
    @bean=Bean.find(params[:id])
  end

  def edit
    @bean=Bean.find(params[:id])
  end

  def update
    @bean=Bean.find(params[:id])
    @bean.update(bean_params)
    redirect_to bean_path(@bean.id)
  end

  def destroy
     @bean=Bean.find(params[:id])
    @bean.destroy
    redirect_to beans_path
  end

  private

  def bean_params
    params.require(:bean).permit(:image,:beans_name,:loast_lebel,:origin,:process,:feedback,:purchase)
  end
end
