Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tribe_members, only: %i[new create]

  get 'statistics', to: "pages#statistics"
end
