Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations]
  root 'landing_page#index'

  get '/landing_page', to: 'landing_page#index'
  get '/landing_page/thanks', to: 'landing_page#thanks'
  get '/landing_page/terms', to: 'landing_page#terms'
  get '/landing_page/privacy_policies', to: 'landing_page#privacy_policies'
  post '/landing_page', to: 'landing_page#create'

  get '/dashboard', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :beta_users
    resources :groups
    resources :raxae_services
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
