Rails.application.routes.draw do

  root 'welcome#index'
  get 'welcome/index'

  get 'students/basic_info'
  get 'students/checkStatus'

  post 'welcome/login'


  resources :students
  resources :instructors
  resources :courses

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
