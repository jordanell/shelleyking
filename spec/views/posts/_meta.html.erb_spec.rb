require 'rails_helper'

describe 'posts/_meta.html.erb' do
  include TruncateHtmlHelper

  it 'should render name' do
    @post = FactoryGirl.create(:post)

    render partial: 'posts/meta', locals: { post: @post }

    rendered.should have_content('Shelley King')
  end

  it 'should display the date' do
    @post = FactoryGirl.create(:post)

    render partial: 'posts/meta', locals: { post: @post }

    rendered.should have_content(@post.created_at.strftime('%B %d, %Y'))
  end
end
