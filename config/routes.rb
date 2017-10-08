Rails.application.routes.draw do

  get 'welcome/index'

  get 'students/basic_info'
  get 'students/apply'
  get 'students/checkStatus'
  post 'welcome/login'


  resources :students
  resources :instructors

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
