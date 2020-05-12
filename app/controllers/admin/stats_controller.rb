class Admin::StatsController < ApplicationController

    def index
      @problem_count = Problem.count
      @users_count = User.count
      @last_problem = Problem.last
    end
  end