Rails.application.routes.draw do

  get 'admin/index'
  get 'admin', to: 'admin#index'
  get 'admin/courses'
  get 'admin/instructors'
  get 'admin/applies'
  get 'admin/offers'
  get 'admin/ta_matching'
  #get 'offers/send_email'
  #get 'courses/:course_id/offers/:id/send_email'

  get 'applies/index'

  root 'welcome#index'
  get 'welcome/index'

  get 'students/basic_info'
  get 'students/checkStatus'

  post 'welcome/login'


  resources :students do
    resources :applies
  end

  resources :instructors
  resources :courses do
    resources :offers do
      get 'send_email'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
