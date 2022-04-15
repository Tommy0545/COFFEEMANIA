class CafeCommentsController < ApplicationController
  def create
    @cafe=Cafe.find(params[:cafe_id])
    @cafe_comment=current_user.cafe_comments.new(cafe_comment_params)
    @cafe_comment.cafe_id=@cafe.id
    if @cafe_comment.save
      redirect_to cafe_path(@cafe)
    else
      @error_comment = @cafe_comment
      render 'cafes/show'
    end
  end

  def destroy
    CafeComment.find(params[:id]).destroy
    redirect_to cafe_path(params[:cafe_id])
  end

  private
  def cafe_comment_params
    params.require(:cafe_comment).permit(:comment)
  end
end
