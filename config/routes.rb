Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos
  root "todos#index"

  namespace :admin do
    root "todos#index"
  end

end
