class CommentsController < ApplicationController
  
  def create

    @comment = Comment.new(comment_params)
    @comment.save

    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = Prototype.find(comment_params[:prototype_id])
      @comment = Comment.new
      @comments = @prototype.comments.includes(:user)
      render "prototypes/show"
    end

  end



  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
