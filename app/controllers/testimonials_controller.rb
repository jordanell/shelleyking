class TestimonialsController < ApplicationController
  def index
    @testimonials = Testimonial.all.order(position: :asc)
  end
end
