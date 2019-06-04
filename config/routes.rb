Rails.application.routes.draw do
  root to: 'short_links#new'

  get 's/:shortened_url_key', to: 'short_links#index'
  get 'a/:admin_url_key', to: 'short_links#admin'

  resources :short_links, only: [:new, :create, :show, :update]
end
