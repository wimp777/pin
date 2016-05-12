Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  get 'about' => 'pages#about'


  root "pages#home"
end
