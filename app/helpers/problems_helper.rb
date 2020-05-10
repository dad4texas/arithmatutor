module ProblemsHelper

  def us_states
    [
      ['Bryson Elementary'],
      ['Chisholm Ridge Elementary'],
      ['Comanche Springs Elementary'],
      ['Copper Creek Elementary'],
      ['Dozier Elementary'],
      ['Eagle Mountain Elementary'],
      ['Elkins Elementary'],
      ['Gililland Elementary'],
      ['Greenfield Elementary'],
      ['High Country Elementary'],
      ['Lake Pointe Elementary'],
      ['Northbrook Elementary'],
      ['Parkview Elementary'],
      ['Remington Point Elementary'],
      ['Saginaw Elementary'],
      ['Willow Creek Elementary'],
      ['Creekview Middle School'],
      ['Ed Willkie Middle School'],
      ['Highland Middle School'],
      ['Marine Creek Middle School'],
      ['Prairie Vista Middle School'],
      ['Wayside Middle School'],
      ['Boswell High School'],
      ['Chisholm Trail High School'],
      ['Saginaw High School'],
      ['Watson High School'],

    ]
end


  def edit_problem(user, problem)
    link_to "Edit Problem", edit_user_problem_path(user, problem), id: 'edit-problem'
  end

  def delete_problem(user, problem)
    link_to "Delete Problem", user_delete_problem_path(user, problem), id: 'delete-problem', method: :delete, confirm: "Are you sure?"
  end

end
