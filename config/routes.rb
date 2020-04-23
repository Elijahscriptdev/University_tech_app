Rails.application.routes.draw do
  get 'welcome/home'
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  resources :students, except: [:destroy]
  get 'about', to: 'pages#about'
  get 'courses', to:'courses#index'
  root 'welcome#home'
  get 'courses/new', to: 'courses#new'
  post 'course_enroll', to: 'student_courses#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
