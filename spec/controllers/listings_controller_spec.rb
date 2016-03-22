require 'rails_helper'

describe ListingsController, type: :controller do
  render_views

  describe '#index' do
    it 'should render the index template' do
      get :index

      response.should render_template('index')
    end
  end
end
