require 'rails_helper'

describe 'root/show.html.erb' do
  it 'should render' do
    expect{ render }.not_to raise_error
  end

  it 'should render quick links' do
    render

    ['Residential', 'Condo', 'Investment'].each do |category|
      rendered.should have_content(category)
    end
  end

  it 'should render query form' do
    render

    rendered.should have_content('What are you looking for?')
  end

  it 'should render featured post' do
    @featured_post = FactoryGirl.create(:post)

    render

    rendered.should have_content(@featured_post.title)
  end

  it 'should render featured testimonials' do
    @featured_testimonials = [FactoryGirl.create(:testimonial)]

    render

    rendered.should have_content(@featured_testimonials[0].quote)
  end
end
