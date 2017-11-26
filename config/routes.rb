Rails.application.routes.draw do

  get 'admin/index'
  get 'admin', to: 'admin#index'
  get 'admin/courses'
  get 'admin/instructors'
  get 'admin/students'
  get 'admin/applies'
  get 'admin/offers'
  get 'admin/ta_matching'


  get 'offer_decision/decide'
  post 'offer_decision/accept'
  post 'offer_decision/reject'
  get 'offer_decision/thankyou'

  #get 'applies/index'
  
  #get 'students/basic_info'
  #get 'students/checkStatus'

  root 'welcome#index'
  get 'welcome/index'
  post 'welcome/login'
  get 'welcome/newStudent'
  post 'welcome/createStudent'

  resources :students do
    resources :applies
    get 'dashboard'
    get 'basic_info'
    get 'checkStatus'
  end

  resources :instructors do
    get 'dashboard'
    get 'courses'
    get 'applies'
  end
  
  
  resources :courses do
    resources :offers do
      get 'send_email'
    end
    get 'candidates'
    post 'updateCandidates'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
