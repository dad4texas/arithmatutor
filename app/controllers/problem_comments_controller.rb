class ProblemCommentsController < ApplicationController

  def create
    puts params.inspect
    @user = User.find_by(id: params[:user_id])
    @problem = @user.problems.find_by(id: params[:id])
    @current_user = current_user
    @comment = ProblemComment.new(comment_params)
    if @comment.save
      render json: @comment, username: current_user
    else
      render controller: 'problem', action: 'show', user_id: @user, id: @problem
    end
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @problem = @user.problems.find_by(id: params[:id])
    @comments = @problem.problem_comments
    render json: @comments
  end

  private

  def comment_params
    params.require(:problem_comment).permit(:user_id, :problem_id, :comment)
  end

end
