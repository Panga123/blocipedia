Rails.application.routes.draw do
resources :wiki

  root 'welcome#index'
  devise_for :users

  get 'about' => 'welcome#about'



end
