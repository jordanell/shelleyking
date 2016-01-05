require 'rails_helper'

describe StaticController, type: :controller do
  render_views

  describe '#about' do
    it 'should render the about template' do
      get :about

      response.should render_template('about')
    end
  end

  describe '#contact' do
    it 'should render the contact template' do
      get :contact

      response.should render_template('contact')
    end
  end
end
