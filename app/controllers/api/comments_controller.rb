class Api::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    
    if @comment.save
      render :json => @comment
    else
      render :json => @comment.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
  end
  
  protected
  
  def comment_params
    params.require(:comment).permit(:content, :course_id)
  end
end