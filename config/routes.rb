Rails.application.routes.draw do
  resources :teachers, except: [:new]
  get 'teachers/signup' => 'teachers#new'
  get 'students/signup' => 'students#new'

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
end
