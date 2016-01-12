require 'rails_helper'

describe 'common/_header.html.erb' do
  it 'should display the site name' do
    render partial: 'common/header'

    rendered.should have_selector('h1', text: 'Shelley King')
  end

  it 'should display Royal LePage logo' do
    render partial: 'common/header'

    rendered.should have_selector(:css, 'div.logo')
  end

  it 'should display the correct links' do
    render partial: 'common/header'

    ['Buying', 'My Listings', 'Office Listings', 'Campbell River Listings',
     'Selling', 'Evaluation', 'Marketing Plan', 'Reports',
     'About', 'Blog', 'Contact'].each do |link|
      rendered.should have_selector('li', text: link)
    end
  end
end
