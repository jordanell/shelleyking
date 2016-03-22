require 'rails_helper'

describe ReportsController, type: :controller do
  render_views

  describe '#index' do
    it 'should render the index template' do
      get :index

      response.should render_template('index')
    end

    it 'should set the reports instance variable' do
      @report = FactoryGirl.create(:report)

      get :index

      expect(assigns(:reports)).to eq([@report])
    end

    it 'should order the reports by position' do
      @report1 = FactoryGirl.create(:report, position: 1)
      @report2 = FactoryGirl.create(:report, position: 2)

      get :index

      expect(assigns(:reports)).to eq([@report1, @report2])
    end
  end
end
