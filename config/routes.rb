Rails.application.routes.draw do
  # Rails admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Root
  root 'root#show'

  # Listings
  resources :listings, only: [:index]

  # Static page routes
  StaticController::STATIC_PAGES.each do |page|
    get "/#{page}", to: "static##{page}", as: "#{page}_static"
  end

  # Reports
  resources :reports, only: [:index]

  # Blog posts
  resources :posts, only: [:index, :show]
  get '/blog', to: 'posts#index', as: 'blog'

  # Testimonials
  resources :testimonials, only: [:index]
end
