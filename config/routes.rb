Rails.application.routes.draw do
  root 'landing_page#index'

  get 'landing_page/thanks', to: 'landing_page#thanks'
  resources :beta_users
  resources :groups
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
