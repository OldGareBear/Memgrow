class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    if @comment.save
      redirect_to course_url(comment_params[:course_id])
    else
      flash["errors"] = @comment.errors.full_messages
      redirect_to course_url(comment_params[:course_id])
    end
  end

  def index
    #
  end

  def show
    # this may desirable for nested comments
  end

  def destroy
    # add when basics are done
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :course_id)
  end
end