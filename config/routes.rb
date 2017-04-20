Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :groups do
    resources :events
  end

  resources :users do
    resources :workouts
    resources :events
    resources :posts
    resources :comments
  end


  get "/" => "groups#home"
  get "/home" => "groups#home"
  get "/getevents" => "groups#getevents"
  get "/adduser" => "users#add"

end
