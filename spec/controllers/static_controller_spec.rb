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

  describe '#mortgage' do
    it 'should render the mortgage template' do
      get :mortgage

      response.should render_template('mortgage')
    end
  end

  describe '#evaluation' do
    it 'should render the evaluation template' do
      get :evaluation

      response.should render_template('evaluation')
    end
  end

  describe '#marketing' do
    it 'should render the marketing template' do
      get :marketing

      response.should render_template('marketing')
    end
  end
end
