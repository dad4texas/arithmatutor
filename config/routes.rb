Rails.application.routes.draw do

  root "welcome#about"

#users and users problem paths
  resources :users do
    resources :problems, except: [:index]
    post '/problems/:id/comments', to: 'problem_comments#create', as: :comment_problem
    get '/problems/:id/comments', to: 'problem_comments#index'
    delete '/problems/:id', to: 'problems#delete', as: :delete_problem
  end

  get '/active_problems', to: 'problems#index'
  post '/help_problem/:id', to: 'helped_problems#help_problem', as: :help_problem
  get '/users/:user_id/problems', to: 'problems#redirect'

  resources :categories, only:[:index, :show]

  get '/auth/github/callhelp' => 'sessions#create'

  get "/login", to: 'sessions#new', as: 'login'
  post "/logging_in", to: 'sessions#create', as: 'logging_in'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
