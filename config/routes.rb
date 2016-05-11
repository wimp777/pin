Rails.application.routes.draw do
  get 'pages/home'
  get 'about' => 'pages#about'


  root "pages#home"
end
