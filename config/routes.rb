Rails.application.routes.draw do

  root 'welcome#index'
  get 'welcome/index'

  get 'students/apply'
  get 'students/checkStatus'
  post 'welcome/login'


  resources :students
  resources :instructors

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
