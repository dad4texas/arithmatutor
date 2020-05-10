module UsersHelper

  def correct_user(user)
    user == current_user
  end

  def guest_user(user)
    user != current_user
  end

  def helped_user(user, problem)
    user.problems_helped.include?(problem) if user 
  end

end
