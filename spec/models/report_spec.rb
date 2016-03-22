# == Schema Information
#
# Table name: reports
#
#  id                       :integer          not null, primary key
#  title                    :string           not null
#  description              :text
#  position                 :integer
#  created_at               :datetime
#  updated_at               :datetime
#  report_file_file_name    :string
#  report_file_content_type :string
#  report_file_file_size    :integer
#  report_file_updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Report, type: :model do
  before do
    @report = FactoryGirl.create(:report)
  end

  subject{ @report }

  # Attributes
  it { should respond_to(:id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:position) }
  it { should respond_to(:report_file_file_name) }
  it { should respond_to(:report_file_content_type) }
  it { should respond_to(:report_file_file_size) }
  it { should respond_to(:report_file_updated_at) }

  # Validations
  it 'should have a title' do
    @report.title = nil

    @report.should_not be_valid
  end

  it 'should have a report file' do
    @report.report_file = nil

    @report.should_not be_valid
  end
end
