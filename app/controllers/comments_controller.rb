class CommentsController < ApplicationController

  def create
    @male_bettum = MaleBettum.find(params[:male_bettum_id])
    @comment = @male_bettum.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to male_bettum_path(@male_bettum)
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :body, :rating)
    end

end
