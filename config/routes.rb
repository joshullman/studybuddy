Rails.application.routes.draw do

  get 'teachers/signup' => 'teachers#new'
  resources :teachers do
    resources :classrooms
  end

  resources :assignments

  get 'students/signup' => 'students#new'
  resources :students
  resources :classroom_students

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'

  root 'teachers#index'
end
