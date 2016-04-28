require 'rails_helper'

describe RootController, type: :controller do
  render_views

  describe '#show' do
    it 'should respond 200' do
      get :show

      response.status.should eq(200)
    end

    it 'should render the show template' do
      get :show

      response.should render_template('show')
    end

    it 'should set the featured_post instance variable' do
      @post = FactoryGirl.create(:post, featured: true)

      get :show

      expect(assigns(:featured_post)).to eq(@post)
    end

    it 'should limit the featured_post instance variable to the first featured post' do
      @post1 = FactoryGirl.create(:post, featured: true)
      @post2 = FactoryGirl.create(:post, featured: true)

      get :show

      expect(assigns(:featured_post)).to eq(@post1)
    end
  end
end
