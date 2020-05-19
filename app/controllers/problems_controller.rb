class ProblemsController < ApplicationController
  before_action :set_user_and_problem, only:[:show, :edit, :update, :destroy]
  before_action :allowed_user, only:[:edit, :destroy]

  def index
    @problems = Problem.active_problems
    respond_to do |format|
      format.html{render :index}
      format.json{render json: @problems, status: 200}
    end
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @problem = @user.problems.new(user_id: params[:user_id])
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to user_problem_path(@problem.user_id, @problem)
    else
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html{render :show}
      format.json{render json: @problem, status: 200}
    end
  end

  def edit
  end

  def update
    @problem.update(problem_params)
    redirect_to user_problem_path(@user, @problem), flash: {notice: "Your problem has been updated!"}
  end

  def destroy
    @problem.destroy
    redirect_to root_path, flash:{notice: "Your problem has been deleted"}
  end

  def redirect
    redirect_to new_user_problem_path(params[:user_id])
  end

  private

  def problem_params
    params.require(:problem).permit(:name, :description, :user_id, :active, :school, category_ids:[], categories_attributes:[:name])
  end

  def set_user_and_problem
    if params[:user_id] && User.exists?(params[:user_id])
      @user = User.find_by(id: params[:user_id])
      @problem = @user.problems.find_by(id: params[:id])
      if @problem.nil?
        redirect_to active_problems_path, flash:{alert: "That problem does not exist."}
      end
    else
      redirect_to active_problems_path, flash:{alert: "That user does not exist."}
    end
  end

  def allowed_user
    @problem = Problem.find_by(id: params[:id])
    unless current_user == @problem.user
      redirect_to active_problems_path, flash:{alert: "You don't have access to that."}
    end
  end



end
