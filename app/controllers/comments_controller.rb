class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @male_bettum = MaleBettum.find(params[:male_bettum_id])
    @comment = @male_bettum.comments.new(comment_params)
    @comment.user = current_user
    @user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @male_bettum, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @male_bettum }
        format.js
      else
        format.html { redirect_to @male_bettum, alert: 'Review not saved.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    male_bettum = @comment.male_bettum
    # authorize! :destroy, @comment
    @comment.destroy
    redirect_to male_bettum
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :body, :rating)
    end

end
