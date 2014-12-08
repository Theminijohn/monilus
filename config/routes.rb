Rails.application.routes.draw do

  root 'pages#home'

  # User
  devise_for :users, path: '',
    path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register' }

  # Expenses
  resources :expenses

  # Tags
  get 'tags/:tag' => 'expenses#index', as: :tag
end
