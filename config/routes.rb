Rails.application.routes.draw do

  resources :tiles
  devise_for :users
  
  get 'pages/home'
  get 'about' => 'pages#about'


  root "pages#home"
end
