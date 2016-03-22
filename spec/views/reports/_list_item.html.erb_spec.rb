require 'rails_helper'

describe 'reports/_list_item.html.erb' do
  include TruncateHtmlHelper

  it 'should display the title' do
    @report = FactoryGirl.create(:report)

    render partial: 'reports/list_item', locals: { report: @report }

    rendered.should have_content(@report.title)
  end

  it 'should display the truncated description' do
    @report = FactoryGirl.create(:report)

    render partial: 'reports/list_item', locals: { report: @report }

    rendered.should have_content(@report.description)
  end

  it 'should display the download link' do
    @report = FactoryGirl.create(:report)

    render partial: 'reports/list_item', locals: { report: @report }

    rendered.should have_content('Download report')
  end
end
