require 'rails_helper'

describe 'testimonials/index.html.erb' do
  it 'should render' do
    expect{ render }.not_to raise_error
  end

  it 'should render testimonials' do
    @testimonials = [FactoryGirl.create(:testimonial)]

    render

    rendered.should render_template(partial: 'testimonials/_list_item')
  end

  it 'should render no testimonials message' do
    @testimonials = []

    render

    rendered.should have_content('There are no testimonials yet. Check back soon!')
  end
end
