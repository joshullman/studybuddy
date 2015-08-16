Rails.application.routes.draw do

  root 'teachers#index'

  get 'teachers/signup' => 'teachers#new'
  resources :teachers

  get 'students/signup' => 'students#new'
  resources :students
  get 'students/:id/class_assignments/:id', :to => 'students#class_assignments'


  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
end
