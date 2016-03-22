require 'rails_helper'

describe 'reports/index.html.erb' do
  it 'should render' do
    expect{ render }.not_to raise_error
  end

  it 'should render reports' do
    @reports = [FactoryGirl.create(:report)]

    render

    rendered.should render_template(partial: 'reports/_list_item')
  end

  it 'should render no reports message' do
    @reports = []

    render

    rendered.should have_content('There are no reports yet. Check back soon!')
  end
end
