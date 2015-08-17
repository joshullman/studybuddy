Rails.application.routes.draw do

  root 'welcome#index'

  get 'teachers/signup' => 'teachers#new'
  resources :teachers do
    resources :classrooms
  end

  resources :assignments

  get 'students/signup' => 'students#new'
  resources :students

  get 'students/:id/class_assignments/:id', :to => 'students#class_assignments'

  resources :classroom_students

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'

end
