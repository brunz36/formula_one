Rails.application.routes.draw do
  get 'pages/landing'

  root 'pages#landing'

  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
