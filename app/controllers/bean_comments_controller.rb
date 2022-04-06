class BeanCommentsController < ApplicationController
  def create
    bean=Bean.find(params[:bean_id])
    comment=current_user.bean_comments.new(bean_comment_params)
    comment.bean_id=bean.id
    comment.save
    redirect_to bean_path(bean)
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
