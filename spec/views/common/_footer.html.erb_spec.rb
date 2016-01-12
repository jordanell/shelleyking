require 'rails_helper'

describe 'common/_footer.html.erb' do
  it 'should display the name' do
    render partial: 'common/footer'

    rendered.should have_content('Shelley King')
  end

  it 'should display the correct links' do
    render partial: 'common/footer'

    ['My Listings', 'Office Listings', 'Campbell River Listings',
     'Evaluation', 'Marketing Plan', 'Reports',
     'About', 'Blog', 'Contact'].each do |link|
      rendered.should have_selector('li', text: link)
    end
  end

  it 'should display legal notice' do
    render partial: 'common/footer'

    rendered.should have_content('All rights reserved.')

    # Make sure year is up to date
    rendered.should have_content(Time.new.year)
  end

  it 'should display the correct icons' do
    render partial: 'common/footer'

    ['fa-linkedin', 'fa-envelope'].each do |icon|
      rendered.should have_selector('i.' + icon)
    end
  end
end
