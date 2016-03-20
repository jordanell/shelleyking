class RootController < ApplicationController
  def show
    # Get the featured post and limit to first one
    @featured_post = Post.where(featured: true).first

    # Get the featured testimonials
    @featured_testimonials = Testimonial.where(featured: true).limit(3)
  end
end
