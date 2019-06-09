Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Only for reference routing

  resources :users, only: [:index, :show, :create, :update, :destroy]
  # get 'users/:id', to: 'users#show' #What the code up do...
  #get 'schedule', to: 'users#schedule'
  put 'users', to: 'users#self_update'
  resources :sessions, only: :create
  delete 'sessions', to: 'sessions#destroy'
  #post 'sessions/:link', to: 'sessions#guest_create'

  #resources :groups do
  #  resources :members, only: [:show, :index, :create, :update, :destroy]
  #  # get ':group_id/members/:id', to: 'members#show'
  #end

end
