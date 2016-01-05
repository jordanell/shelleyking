class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Before filters
  before_filter :set_seo_tags

  private

  def set_seo_tags
    set_meta_tags title:        'Shelley King',
                  description:  '',
                  keywords:     %w[Shelley King ShelleyKing Realtor Royal LePage],
                  og:  {
                    title:        'Shelley King',
                    type:         'website',
                    url:          'http://shelleyking.ca',
                    image:        ActionController::Base.helpers.image_path('favicons/favicon-96x96.png'),
                    description:  ''
                  },
                  twitter: {
                    card:         'summary',
                    url:          'http://shelleyking.ca',
                    title:        'Shelley King',
                    image:        ActionController::Base.helpers.image_path('favicons/favicon-96x96.png'),
                    description:  ''
                  }
  end

  def render_error(code)
    @status_code = code

    render 'errors/show', status: code
  end
end
