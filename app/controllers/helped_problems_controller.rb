class HelpedProblemsController < ApplicationController
  before_action :authentication_required

  def help_problem
    @problem = Problem.find(params[:id])
    @user = User.find_by(id: current_user.id)
    if @user.problems_helped.where(id: @problem.id).exists?
      redirect_to user_problem_path(@problem.user, @problem), flash:{notice: "You are already helping this kid!"}
    else
      @user.add_problem(@problem)
      redirect_to user_problem_path(@problem.user, @problem), flash:{notice: "Thank you this kid needs lots of help!"}
    end
  end

end

