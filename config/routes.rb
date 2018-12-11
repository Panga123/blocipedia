Rails.application.routes.draw do
resources :wiki

  devise_for :users
  get 'about' => 'welcome#about'
  root 'welcome#index'






end
