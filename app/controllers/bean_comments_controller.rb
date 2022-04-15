class BeanCommentsController < ApplicationController
  def create
    @bean=Bean.find(params[:bean_id])
    @bean_comment=current_user.bean_comments.new(bean_comment_params)
    @bean_comment.bean_id=@bean.id
    if @bean_comment.save
      redirect_to bean_path(@bean)
    else
      @error_comment = @bean_comment
      render 'beans/show'
    end
  end

  def destroy
    BeanComment.find(params[:id]).destroy
    redirect_to bean_path(params[:bean_id])
  end

  private
  def bean_comment_params
    params.require(:bean_comment).permit(:comment)
  end
end
