class CommentsController < ApplicationController
  def create
      comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to recipe_path(comment.recipe)
    else
      redirect_to recipe_path(comment.recipe)
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(recipe_id: params[:recipe_id])
  end
end
