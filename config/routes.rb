Rails.application.routes.draw do


  devise_for :users

  resources :sonomas

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
