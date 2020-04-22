Rails.application.routes.draw do
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  resources :students, except: [:destroy]
  get 'about', to: 'pages#about'
  root 'courses#index'
  get 'courses/new', to: 'courses#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
