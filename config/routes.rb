Rails.application.routes.draw do

  resources :posts
  resources :questions

  get 'about' => 'welcome#about'

  root 'welcome#index'

  get 'welcome/contact'

end
