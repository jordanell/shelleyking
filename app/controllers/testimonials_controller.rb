class TestimonialsController < ApplicationController
  def index
    @testimonials = Testimonial.order(position: :asc)
  end
end
