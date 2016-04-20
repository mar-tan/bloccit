Rails.application.routes.draw do
  root 'welcome#index'

  get 'about', to: 'welcome#about'

  get 'welcome/contact'

end
