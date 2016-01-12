require 'rails_helper'

describe 'testimonials/_list_item.html.erb' do
  it 'should display the quote' do
    @testimonial = FactoryGirl.create(:testimonial)

    render partial: 'testimonials/list_item', locals: { testimonial: @testimonial }

    rendered.should have_content(@testimonial.quote)
  end

  it 'should display the name' do
    @testimonial = FactoryGirl.create(:testimonial)

    render partial: 'testimonials/list_item', locals: { testimonial: @testimonial }

    rendered.should have_content(@testimonial.name)
  end
end
