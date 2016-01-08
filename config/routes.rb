Rails.application.routes.draw do
  # Rails admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Root
  root 'root#show'

  # Static page routes
  StaticController::STATIC_PAGES.each do |page|
    get "/#{page}", to: "static##{page}"
  end

  # Blog posts
  resources :posts, only: [:index, :show]
  get '/blog', to: 'posts#index', as: 'blog'

  # Testimonials
  resources :testimonials, only: [:index]
end
