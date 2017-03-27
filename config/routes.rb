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
  get "/home" => "group#home"
  get "/posts/new" => "posts#new"

end
