Rails.application.routes.draw do
  # Rails admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Blog posts
  resources :posts, only: [:index, :show]
  get '/blog', to: 'posts#index', as: 'blog'
end
