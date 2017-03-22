Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :groups do
    resources :events
  end

  resources :workouts do
    resources :events
  end

  resources :users do
    resources :events
  end


  get "/" => "groups#home"
  get "/home" => "group#home"


end
