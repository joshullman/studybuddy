Rails.application.routes.draw do

  root 'teachers#index'

  get 'teachers/signup' => 'teachers#new'
  resources :teachers

  get 'students/signup' => 'students#new'
  resources :students


  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
end
